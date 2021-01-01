using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneri.Enums;
using HastaneOneriEntity.Entity;
using HastaneOneriEntity.Enums;

namespace HastaneOneriWeb
{
    public partial class Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
           

            X.Msg.Info("Hoş Geldiniz", AktifKullanici.Ad + " " + AktifKullanici.Soyad + " " + "Hoş Geldiniz").Show();
            kimlik.Text = AktifKullanici.Ad + " " + AktifKullanici.Soyad+ " "+AktifKullanici.Rol;
            var id = AktifKullanici.Id;
          
            if (AktifKullanici.Rol == KullanciRol.Kullanici)
            {
                btnKurumEkle.Hide();
                btnkullaniciekle.Hide();
                Birlik.Hide();
                SilinenKullanici.Hide();
            }
            if (AktifKullanici.Rol == KullanciRol.BirlikYönetici)
            {
                Birlik.Hide();
                SilinenKullanici.Hide();
            }
        }

        private string ip()
        {
            string ipadr;
            ipadr = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipadr == "" || ipadr == null)

                ipadr = Context.Request.ServerVariables["REMOTE_ADDR"];
            return ipadr;

        }

      [DirectMethod(Namespace = "kapat")]
        public void oturumuKapat()
        {
            if (Request.Cookies["ASP.NET_SessionId"] != null )
            {
                BldSvc.LogGuncelle(new BildirimLog
                {
                   SessionId = Session.SessionID,
                   Ip=ip(),
                   KullaniciId=AktifKullanici.Id,
                   UserAgent=Request.UserAgent,
                   CikisTarihi = DateTime.Now
                });

                var httpCookie = Response.Cookies["ASP.NET_SessionId"];
                if (httpCookie != null)
                    httpCookie.Expires = DateTime.Now.AddDays(-1);
            }
          
            Response.Redirect("Login.aspx");
        }
    }
}