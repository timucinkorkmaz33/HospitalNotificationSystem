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
    public partial class KurumKaydetPanel : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);
            if (IsPostBack || X.IsAjaxRequest) return;
            Birlikstore.DataSource = BldSvc.BirlikListele();
            Birlikstore.DataBind();

        }
        [DirectMethod(Namespace = "Ekle")]
        public void ekle()
        {
            BldSvc.setkurumekle(new KurumDto
            {
                Adi = Adi.Text,
                BirlikId = AktifKullanici.BirlikId,
                OlusturmaTarihi = DateTime.Now,
                SMTPPass = SMTPPass.Text,
                SkrsKodu = Convert.ToInt32(SkrsKodu.Text),
                SMTPServer = SMTPServer.Text,
                SMTPUser = SMTPUser.Text,
                EMail = EMail.Text,
                DnsName = HostAdresi.Text

            });
            X.Msg.Alert("Kayıt İşlemi", "Kayıt Başarıyla Yapılmıştır").Show();
            
        }

        
    }
}