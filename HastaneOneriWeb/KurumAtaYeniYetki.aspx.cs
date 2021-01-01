using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;

namespace HastaneOneriWeb
{
    public partial class KurumAtaYeniYetki :BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
          listele();
        }

        public void listele()
        {
            BildirimFiltreDto filtreDto = new BildirimFiltreDto();
            kurumstore.DataSource = BldSvc.kurumno(AktifKullanici);
            kurumstore.DataBind();
        }

        [DirectMethod(Namespace = "Ekle")]
        public void ekle()
        {
            int id = Convert.ToInt32(Request.QueryString["param"]);
            BldSvc.yetkiekle(new KullaniciKurumYetkiDto
            {
             KullaniciId=id,
             KurumId =Convert.ToInt32(KurumKodu.SelectedItem.Value)
            });
            X.Msg.Alert("Ekleme İşlemi", "Yetki Ekleme İşlemi Başarıyla Gerçekleşmiştir!").Show();
            listele();
        }
    }
}