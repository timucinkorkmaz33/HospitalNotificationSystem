using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneri.Enums;

namespace HastaneOneriWeb
{
    public partial class KurumAta : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
            //kurumstore.DataSource = BldSvc.kurumno();
            //kurumstore.DataBind();
            listele();
        }

        public void listele()
        {

            var BirlikId = AktifKullanici.BirlikId;
            var list = BldSvc.BirlikYoneticicilistele(AktifKullanici);
            kullanicistore.DataSource = list;
            kullanicistore.DataBind();
       
        }
        public void guncelle(KullaniciKurumYetkiDto kullanici)
        {

            BldSvc.kullaniciyetkiguncelle(new KullaniciKurumYetkiDto
            {
                Id = kullanici.Id,
                OlusturmaTarihi = kullanici.OlusturmaTarihi,
                Aktif = kullanici.Aktif,
                KurumId = kullanici.KurumId,
                KullaniciId =  kullanici.KullaniciId
                

            });
            listele();
        }
        [DirectMethod(Namespace = "Sil")]
        public void sil(int Id)
        {

            BldSvc.kullaniciyetkisil(Id);
            listele();
        }


        protected void kullanicistore_OnBeforeStoreChanged(object sender, BeforeStoreChangedEventArgs e)
        {
            var result = false;
            string json = e.DataHandler.JsonData;
            if (json == "[]") return;
            StoreDataHandler dataHandler = new StoreDataHandler(json);
            List<KullaniciKurumYetkiDto> list = dataHandler.ObjectData<KullaniciKurumYetkiDto>();

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
