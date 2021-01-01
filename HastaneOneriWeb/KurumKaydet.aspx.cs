using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using Newtonsoft.Json;

namespace HastaneOneriWeb
{
    public partial class KurumKaydet : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
            //Birlikstore.DataSource = BldSvc.BirlikListele();
            //Birlikstore.DataBind();
            BirlikGuncelleStore.DataSource = BldSvc.BirlikListele();
            BirlikGuncelleStore.DataBind();
            listele();
        }

        public void listele()
        {
            kurumstore.DataSource = BldSvc.GetKurumListByKullanici(AktifKullanici);
            kurumstore.DataBind();
        }

        public void guncelle(KurumDto kurum)
        {
            BldSvc.Guncelle(new KurumDto
            {
                Id = kurum.Id,
                Adi = kurum.Adi,
                BirlikId = kurum.BirlikId,
                SMTPPass = kurum.SMTPPass,
                SMTPServer = kurum.SMTPServer,
                SMTPUser = kurum.SMTPUser,
                SkrsKodu = kurum.SkrsKodu,
                OlusturmaTarihi = kurum.OlusturmaTarihi,
                DnsName = kurum.DnsName,
                EMail = kurum.EMail

            });
            listele();
        }
        [DirectMethod(Namespace = "Sil")]
        public void sil(int kurum)
        {
            BldSvc.sil(kurum);
            listele();
        }

        protected void kurumstore_AfterRecordUpdated(object sender, BeforeStoreChangedEventArgs e)
        {
            var result = false;
            string json = e.DataHandler.JsonData;
            if (json == "[]") return;
            StoreDataHandler dataHandler = new StoreDataHandler(json);
            List<KurumDto> list = dataHandler.ObjectData<KurumDto>();

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


