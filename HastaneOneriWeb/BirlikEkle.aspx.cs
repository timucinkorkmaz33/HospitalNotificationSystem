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
    public partial class BirlikEkle : BasePage
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
            Birlikstore.DataSource = BldSvc.BirlikListele();
            Birlikstore.DataBind();
        }

        [DirectMethod(Namespace = "Ekle")]
        public void ekle()
        {
            BldSvc.birlikekle(new BirlikDto
            {
                Adi = Adi.Text,
                OlusturmaTarihi = DateTime.Now,
                Ilkodu = Convert.ToInt32(Ilkodu.Text)
            });
            X.Msg.Alert("Kayıt İşlemi", "Kayıt Başarıyla Yapılmıştır").Show();
            listele();
        }

        [DirectMethod(Namespace = "BirlikSil")]
        public void sil(int BirlikId)
        {
            BldSvc.birliksil(BirlikId);
            listele();
        }

        public void guncelle(BirlikDto birlik)
        {
            BldSvc.birlikguncelle(new BirlikDto
            {
                Id = birlik.Id,
                OlusturmaTarihi = birlik.OlusturmaTarihi,
                Adi = birlik.Adi,
                Aktif = birlik.Aktif,
                Ilkodu = birlik.Ilkodu

            });
            listele();
        }


        protected void Birlikstore_OnBeforeStoreChanged(object sender, BeforeStoreChangedEventArgs e)
        {
            var result = false;
            string json = e.DataHandler.JsonData;
            if (json == "[]") return;
            StoreDataHandler dataHandler = new StoreDataHandler(json);
            List<BirlikDto> list = dataHandler.ObjectData<BirlikDto>();

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