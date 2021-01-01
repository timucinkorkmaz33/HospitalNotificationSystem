using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneri.Enums;

namespace HastaneOneriWeb
{
    public partial class Istatistik : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);

            BildirimFiltreDto filtreDto=new BildirimFiltreDto();

            model.DataSource = BldSvc.IstatistikBildirimSayisi(AktifKullanici,filtreDto);
            model.DataBind();
            pieturstore.DataSource = BldSvc.TurBildirimSayisi(AktifKullanici,filtreDto);
            pieturstore.DataBind();
            cevaplananstore.DataSource = BldSvc.CevaplananBildiriler(AktifKullanici, filtreDto);
            cevaplananstore.DataBind();


        }
    }
}