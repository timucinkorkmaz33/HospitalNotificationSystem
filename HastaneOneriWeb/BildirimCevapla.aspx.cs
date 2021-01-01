using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneriEntity.Enums;

namespace HastaneOneriWeb
{
    public partial class BildirimCevapla : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            int id = Convert.ToInt32(Request.QueryString["param"]);
            var eposta = BldSvc.BildirimEPostaAl(id);
            
            mail_adres.Text = eposta;

        }

        private MailMessage eposta = new MailMessage();
        private void mail_gonder( )
        {
            int id = Convert.ToInt32(Request.QueryString["param"]);
            var kurumId = BldSvc.GetKurumIdByBildirimId(id);
            var x = BldSvc.GetKurumByKurumId(kurumId ?? 0);
            if (string.IsNullOrWhiteSpace(x.EMail) && string.IsNullOrWhiteSpace(x.SMTPPass) && string.IsNullOrWhiteSpace(x.DnsName))
            {
                X.Msg.Alert("Mesaj Adresi Hatası","Sistemde Kayıtlı Mail Adresiniz Bulunmadığı için Gönderim yapamazsınız!").Show();
                return;
            }
                
            eposta.From = new MailAddress(x.EMail);
            eposta.To.Add(mail_adres.Text);
            eposta.Subject = "Cevap";
            eposta.Body = message.Text;
            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new System.Net.NetworkCredential(x.SMTPUser, x.SMTPPass);
                smtp.Port = 587;
                smtp.Host = x.DnsName;
                smtp.EnableSsl = true;
                object userstate = eposta;
                smtp.Send(eposta);
                cevaplanan();
            }
            catch (Exception ex)
            {
                    X.MessageBox.Alert("Hata",ex.ToString()).Show();
            }
           
            //SmtpClient smtp = new SmtpClient();
            //smtp.Credentials = new System.Net.NetworkCredential("adanadhs6@saglik.gov.tr", "Personel1*");
            //smtp.Port = 587;//sağlık govtrnın numara girilecek
            //smtp.Host = "eposta.saglik.gov.tr";
            //smtp.EnableSsl = false;
            //object userstate = eposta;
            //smtp.Send(eposta);
            //cevaplanan();
        }

        [DirectMethod(Namespace = "mail_gonder")]
        public void gonder()
        {
            int id = Convert.ToInt32(Request.QueryString["param"]);
            var eposta = BldSvc.BildirimEPostaAl(id);
            mail_adres.Text = eposta;
            if (Convert.ToInt32(basvuru.SelectedItem.Value) == 1)
            {
                mail_gonder();
            }
            else
            {
                cevaplanan();
            }

        }

        public void cevaplanan()
        {

            int id = Convert.ToInt32(Request.QueryString["param"]);
            BldSvc.bildirimcevapla(new BildirimDto
            {
                Id = id,
                CevapMesaji = message.Text,
                CevapTarihi = DateTime.Now,
                Durum = 1,
                CevapVerenId = AktifKullanici.Id,
                CevapYolu = (CevapYolu?)Convert.ToInt32(basvuru.SelectedItem.Value)

            });
            X.Msg.Alert("İletim Raporu", "Cevabınız İletilmiştir").Show();
        }

    }
}