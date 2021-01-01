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
    public partial class KullaniciEkle : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
         
            birimstore.DataSource = BldSvc.BirlikAl();
            birimstore.DataBind();
            listele();

            if (AktifKullanici.Rol == KullanciRol.BirlikYönetici)
            {
                cmbRol.Items.Add(new Ext.Net.ListItem("BirlikYönetici", "2"));
                cmbRol.Items.Add(new Ext.Net.ListItem("Kullanici", "1"));
            }
            else if (AktifKullanici.Rol == KullanciRol.SysAdmin)
            {
                cmbRol.Items.Add(new Ext.Net.ListItem("SysAdmin", "0"));
                cmbRol.Items.Add(new Ext.Net.ListItem("BirlikYönetici", "2"));
                cmbRol.Items.Add(new Ext.Net.ListItem("Kullanici", "1"));
            }

        }

        public void listele()
        {
            //kullanicistore.RemoveAll();
            
            kullanicistore.DataSource = BldSvc.KullaniciListele(AktifKullanici);
            kullanicistore.DataBind();

        }

        [DirectMethod(Namespace = "Sil")]
        public void sil(int? Id)
        {

            BldSvc.kullanicisil(Id);
            listele();
        }


        public void guncelle(Kullanici kullanici)
        {
            BldSvc.kullaniciguncelle(kullanici);
            listele();
        }

        public void yetkiguncelle(KullaniciKurumYetkiDto kullanici)
        {

            BldSvc.kullaniciyetkiguncelle(new KullaniciKurumYetkiDto
            {
                Id = kullanici.Id,
                OlusturmaTarihi = kullanici.OlusturmaTarihi,
                Aktif = kullanici.Aktif,
                KullaniciId = kullanici.KullaniciId,
                KurumId = kullanici.KurumId

            });

        }

        protected void kullanicistore_AfterRecordUpdated(object sender, BeforeStoreChangedEventArgs e)
        {
            var result = false;
            string json = e.DataHandler.JsonData;
            if (json == "[]") return;
            StoreDataHandler dataHandler = new StoreDataHandler(json);
            List<Kullanici> list = dataHandler.ObjectData<Kullanici>();

            foreach (var item in list)
            {
                switch (e.Action)
                {
                    case StoreAction.Create:
                        e.Cancel = true;
                        break;

                    case StoreAction.Update:
                        guncelle(item);
                        e.Cancel = true;
                        break;

                }
            }
        }


    }

}