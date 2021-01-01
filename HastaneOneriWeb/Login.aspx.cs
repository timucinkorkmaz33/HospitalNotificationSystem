using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Context;
using HastaneOneriEntity.Entity;

namespace HastaneOneriWeb
{
    public partial class Login : BasePage
    {
       
        protected  void Page_Load(object sender, EventArgs e)
        {        if(IsPostBack) return;    
            Session["kullanici"] = null;
         
        }
        private string ip()
        {
            string ipadr;
            ipadr = Context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipadr == "" || ipadr == null)

                ipadr = Context.Request.ServerVariables["REMOTE_ADDR"];
            return ipadr;

        }

        [DirectMethod(Namespace = "Giris")]
        public void giris()
        {
            var deger = Session.SessionID;
          var result=BldSvc.logingiris(kullaniciAdi.Text, sifre.Text);
            if (result != null)
            {
                Session.Add("kullanici", result);
                BldSvc.LogBilgisi(new BildirimLog
                {
                   SessionId =deger,
                   GirisTarihi=DateTime.Now,
                   Ip=ip(),
                   KullaniciId=AktifKullanici.Id,
                   UserAgent=Request.UserAgent
                   
                }
                    );
                Response.Redirect("Default.aspx");
            }
            else
            { 
                X.Msg.Alert("Hatalı Giriş", "Şifre yada Kullanici Adı Hatası").Show();
            }
        }
    }
}