using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace HastaneOneriWeb
{
    public partial class SilinenKullanicilar : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
            listele();
        }

        private void listele()
        {
            kullanicistore.DataSource = BldSvc.SilinenKullaniciListele();
            kullanicistore.DataBind();
        }
        [DirectMethod(Namespace = "Aktif")]
        public void Aktif(int kurum)
        {
            BldSvc.KullaniciAktiflestir(kurum);
            listele();
        }
    }
}