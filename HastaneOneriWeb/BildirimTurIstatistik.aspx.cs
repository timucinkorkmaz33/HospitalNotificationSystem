using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneriEntity.Enums;

namespace HastaneOneriWeb
{
    public partial class BildirimTurIstatistik : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            BildirimFiltreDto filtreDto = new BildirimFiltreDto();
            kurumstore.DataSource = BldSvc.kurumal(AktifKullanici);
            kurumstore.DataBind();
            BldSvc.beklemegunsayisi();
            // listelestore.DataSource = BldSvc.birimal();
            //  listelestore.DataBind();

        }

        [DirectMethod(Namespace = "istatistik")]
        public void istatistiklistele()
        {

            int[] a = new int[cmbAy.SelectedItems.Count];
            int[] b = new int[cmbYil.SelectedItems.Count];
            int[] c = new int[kurum.SelectedItems.Count];
            PersonelEtken[] d = new PersonelEtken[cmbPersonelEtken.SelectedItems.Count];
            SistemEtken[] e = new SistemEtken[cmbSistemEtken.SelectedItems.Count];
            BildirimTuru[] f = new BildirimTuru[secim.SelectedItems.Count];
            int i = 4;

            BildirimFiltreDto filtreDto = new BildirimFiltreDto();

            kurumstore.DataSource = BldSvc.kurumal(AktifKullanici);
            kurumstore.DataBind();


            if (cmbAy.SelectedItem != null)
            {
                for (i = 0; i < cmbAy.SelectedItems.Count; i++)
                {
                    a[i] = Convert.ToInt32(cmbAy.SelectedItems[i].Value);

                }
                filtreDto.AyList = a;
            }

            if (cmbYil.SelectedItem != null)
            {
                for (i = 0; i < cmbYil.SelectedItems.Count; i++)
                {
                    b[i] = Convert.ToInt32(cmbYil.SelectedItems[i].Value);

                }
                filtreDto.YilList = b;
            }

            if (kurum.SelectedItem != null)
            {
                for (i = 0; i < kurum.SelectedItems.Count; i++)
                {
                    c[i] = Convert.ToInt32(kurum.SelectedItems[i].Value);

                }
                filtreDto.KurumList = c;
            }

            if (cmbPersonelEtken.SelectedItem != null)
            {
                for (i = 0; i < cmbPersonelEtken.SelectedItems.Count; i++)
                {
                    d[i] = (PersonelEtken)Convert.ToInt32(cmbPersonelEtken.SelectedItems[i].Value);

                }
                filtreDto.PersonelEtken = d;
            }
            if (cmbSistemEtken.SelectedItem != null)
            {
                for (i = 0; i < cmbSistemEtken.SelectedItems.Count; i++)
                {
                    e[i] = (SistemEtken)Convert.ToInt32(cmbSistemEtken.SelectedItems[i].Value);

                }
                filtreDto.SistemEtken = e;
            }
            if (secim.SelectedItem != null)
            {
                for (i = 0; i < secim.SelectedItems.Count; i++)
                {
                    f[i] = (BildirimTuru)Convert.ToInt32(secim.SelectedItems[i].Value);

                }
                filtreDto.TurList = f;
            }
            PersonelEtken[] personeletken = new PersonelEtken[11];
            lblBildirimSonuc.Text = Convert.ToString(BldSvc.BildirimlerimSay(AktifKullanici, filtreDto));
            listelestore.DataSource = BldSvc.PersonelEtkenSayi(i, AktifKullanici, filtreDto);
            listelestore.DataBind();
            SistemEtkenListele.DataSource = BldSvc.SistemEtkenSayi(i, AktifKullanici, filtreDto);
            SistemEtkenListele.DataBind();
            BasvuruListele.DataSource = BldSvc.BasvuruKanalSayi(i, AktifKullanici, filtreDto);
            BasvuruListele.DataBind();
            IcerikListele.DataSource = BldSvc.IcerikSayi(i, AktifKullanici, filtreDto);
            IcerikListele.DataBind();
            SonucListele.DataSource = BldSvc.SonucSayi(i, AktifKullanici, filtreDto);
            SonucListele.DataBind(); 
            BirimListele.DataSource = BldSvc.BirimSayi(i, AktifKullanici, filtreDto);
            BirimListele.DataBind();
  

        }
    }
}