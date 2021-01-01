using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Context;
using HastaneOneri.Dto;
using HastaneOneri.Enums;
using HastaneOneriEntity.Enums;
using LibKRMD.Annotations;
using LibKRMD.Utils;

namespace HastaneOneriWeb
{
    public partial class Bildirim : BasePage
    {
        private HastaneOneri.Context.HastaneOneriContext cntx = new HastaneOneriContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            birimlerstore.DataSource = BldSvc.birimal();
            birimlerstore.DataBind();

            grupstore.DataSource = BldSvc.grupal();
            grupstore.DataBind();

            if (AktifKullanici != null)
            {
                ximgCap.Hide();
                xtxtCap.Hide();
                KurumStore.DataSource = BldSvc.kurumno(AktifKullanici);
                KurumStore.DataBind();

                e_mail.Hide();
                Konu.Hide();
                tel.Hide();
                Label2.Hide();
                Label3.Hide();
                BasvuruNo.Hide();
            }
            else
            {
                Tarih.Hide();
                Kurumlar.Hide();
                basvuru.Hide();
                Label5.Hide();
                Label4.Hide();
                Sonuc.Hide();
                BasvuruNo.Hide();
            }

            var kurumId = GetKurumId();
            if (kurumId == 0)
            {
                // Response.Write("Olmaz öyle");
                return;
            }

            var kurum = BldSvc.GetKurumById(kurumId);

            if (kurum == null)
            {
                // Response.Write("Kurum null ");
                return;

            }

            lblKurumAdi.Text = kurum.Adi;

            // var user = (dto_kullanicilar)Session["kullanici"];
            //var kurumid = user.KurumId;

        }

        private int GetKurumId()
        {
            var id = 0;
            if (AktifKullanici != null)
            {
                id = Convert.ToInt32(Kurumlar.SelectedItem.Value);
            }
            else if (Request.QueryString["skrsId"] != null)
            {
                var skrs = Convert.ToInt32(Request.QueryString["skrsId"]);
                var kurum = BldSvc.GetKurumBySkrsId(skrs);
                id = kurum.Id;
            }
            else
            {
                var kurum = BldSvc.GetKurumByDns(Request.Url.Host);
                if (kurum != null)
                    id = kurum.Id;
            }
            return id;
        }

        private bool TCKontrol()
        {
            // tc kontrol yazılacak 
            var result = KarUtil.TcDogrulaV2(tcnumber.Text);
            return result;
        }
        private string ip()
        {
            string ipadr;
            ipadr = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipadr == "" || ipadr == null)

                ipadr = Context.Request.ServerVariables["REMOTE_ADDR"];
            return ipadr;

        }

        [DirectMethod(Namespace = "Ekle")]
        public void ekle()
        {

            string capRand = null;

            if (Session["capRand"] != null)
                capRand = Convert.ToString(Session["capRand"]);

            var girilen = xtxtCap.Text.ToUpper();
            if (girilen == capRand || AktifKullanici != null)
            {

                
                    if (tcnumber.Text != "" && name.Text != "" && mesaj.Text != ""
                        && Tur.Value != "" && gruplar.Value != "" && birimler.Value != "")
                    {

                        var dto = new BildirimDto
                        {
                            KurumId = GetKurumId(),
                            UserAgent = Request.UserAgent,
                            Ip = ip(),
                            Durum = 0,
                            Tarih = DateTime.Now,
                            TcId = tcnumber.Text,
                            Ad = name.Text,
                            Soyad = s_name.Text,
                            BasvuruYolu = BasvuruYolu.WebSite,
                            EPosta = e_mail.Text,
                            Gsm = tel.Text,
                            Konu = Konu.Text,
                            Tur = (BildirimTuru)Convert.ToInt32(Tur.SelectedItem.Value),
                            GrupId = Convert.ToInt32(gruplar.SelectedItem.Value),
                            BirimId = Convert.ToInt32(birimler.SelectedItem.Value),
                            Mesaj = mesaj.Text,
                            OlusturmaTarihi = DateTime.Now,
                            KullaniciId = 1,
                            BasvuruNo = 0,
                            Sonuc = 0,
                            PersonelEtken = (PersonelEtken)Convert.ToInt32(cmbPersonelEtken.SelectedItem.Value),
                            SistemEtken = (SistemEtken)Convert.ToInt32(cmbSistemEtken.SelectedItem.Value)
                        };

                        if (AktifKullanici != null)
                        {
                            dto.BasvuruYolu = (BasvuruYolu)Convert.ToInt32(basvuru.SelectedItem.Value);
                            dto.KullaniciId = AktifKullanici.Id;
                            dto.Tarih = Tarih.SelectedDate;
                            dto.OlusturmaTarihi = Tarih.SelectedDate;
                            dto.Sonuc = (Sonuc?)Convert.ToInt32(Sonuc.SelectedItem.Value);
                            dto.BasvuruNo = Convert.ToInt32(BasvuruNo.Value);
                        }


                        BldSvc.setbildirim(dto);
                        X.Msg.Alert("Gönderim İşlemi", "Mesajınız Başarıyla Alınmıştır").Show();

                        tcnumber.Text = ""; name.Text = "";
                        e_mail.Text = ""; Konu.Text = "";
                        tel.Text = ""; mesaj.Text = "";
                        Tur.Value = ""; gruplar.Value = "";
                        birimler.Value = ""; s_name.Text = "";
                        basvuru.Value = ""; Kurumlar.Value = "";
                        Tarih.Value = "";
                        cmbSistemEtken.Value = "";
                        Sonuc.Text = "";
                        cmbPersonelEtken.Value = "";
                        mail_gonder();
                    }
                    else
                    {
                        X.Msg.Alert("Eksik Doldurulmuş Alan", "Tüm Alanların Doldurulması Zorunludur").Show();
                    }
              
            }
            else
            {
                captcha.Show();
            }
        }

        private MailMessage eposta = new MailMessage();

        private void mail_gonder()
        {
            var kurumId = GetKurumId();
            var kurum = BldSvc.GetKurumById(kurumId);
            if (string.IsNullOrWhiteSpace(kurum.EMail))
                return;//kurumun mail adresi yok. o yüzden mail göndrmeyi deneme.

            eposta.From = new MailAddress("notify@kardelenyazilim.com");
            eposta.To.Add(kurum.EMail);
            eposta.Subject = Konu.RawText;
            eposta.Body = mesaj.RawText;

            SmtpClient smtp = new SmtpClient();
            smtp.Credentials = new System.Net.NetworkCredential("notify@kardelenyazilim.com", "KarmedNotify1");
            smtp.Port = 587;
            smtp.Host = "mail.kardelenyazilim.com";
            smtp.EnableSsl = false;
            object userstate = eposta;
            smtp.Send(eposta);

        }
    }
}
