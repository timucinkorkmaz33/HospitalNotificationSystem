using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using HastaneOneri.Svc;
using HastaneOneriEntity.Entity;

namespace HastaneOneriWeb
{
    public class BasePage:Page
    {
        private BildirimSvc bildirimsvc;
        protected BildirimSvc BldSvc
        {
            get { return bildirimsvc ?? (bildirimsvc = new BildirimSvc()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected Kullanici AktifKullanici
        {
            get
            {
               return  Session["kullanici"] as Kullanici;
                
            }
        }
    }
}