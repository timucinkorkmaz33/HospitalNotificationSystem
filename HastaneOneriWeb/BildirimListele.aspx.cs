using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneri.Enums;
using HastaneOneriEntity.Enums;

namespace HastaneOneriWeb
{
    public partial class BildirimListele : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);

            listele();

        }

        public void listele()
        {

            BildirimFiltreDto filtreDto = new BildirimFiltreDto();
            kurumstore.DataSource = BldSvc.kurumal(AktifKullanici);
            kurumstore.DataBind();
            Baslangic.SelectedDate = DateTime.Now.AddMonths(-3);
            Bitis.SelectedDate = DateTime.Now.AddDays(1);
            BldSvc.beklemegunsayisi();

            listelestore.DataSource = BldSvc.BildirimlerimiListele(AktifKullanici, filtreDto);
            listelestore.DataBind();
        }

        [DirectMethod(Namespace = "istatistik")]
        public void istatistiklistele()
        {
            BildirimFiltreDto filtreDto = new BildirimFiltreDto();
          
            kurumstore.DataSource = BldSvc.kurumal(AktifKullanici);
            kurumstore.DataBind();

            filtreDto.BaslangicTarihi = Baslangic.SelectedDate;
            filtreDto.BitisTarihi = Bitis.SelectedDate;
            if (!string.IsNullOrWhiteSpace(secim.SelectedItem.Value))
                filtreDto.Tur = (BildirimTuru?)Convert.ToInt32(secim.SelectedItem.Value);

            if (!string.IsNullOrWhiteSpace(kurum.SelectedItem.Value))
                filtreDto.KurumId = Convert.ToInt32(kurum.SelectedItem.Value);
            
            if (!string.IsNullOrWhiteSpace(cmbCevapDurum.SelectedItem.Value))
                filtreDto.CevapDurumu = Convert.ToInt32(cmbCevapDurum.SelectedItem.Value);



            listelestore.DataSource = BldSvc.BildirimlerimiListele(AktifKullanici, filtreDto);
            listelestore.DataBind();

        }

        [DirectMethod(Namespace = "BildirimSil")]
        public void BildirimSil(int Id) 
        {
            BldSvc.BildirimSil(Id);

            listele();
        }


    }
}