using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneriEntity.Entity;

namespace HastaneOneriWeb
{
    public partial class sifredegistir : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            base.Page_Load(sender, e);

        }

    [DirectMethod(Namespace = "degistir")]
        public void Sifredegis()
        {
            
            if (sifre.Text == sifre2.Text)
            {
           
                BldSvc.sifredegistir(new Kullanici
                {
                    Id = AktifKullanici.Id,
                    GirisAd = AktifKullanici.GirisAd,
                    Ad = AktifKullanici.Ad,
                    Aktif = AktifKullanici.Aktif,
                    BirlikId = AktifKullanici.BirlikId,
                    Rol = AktifKullanici.Rol,
                    Soyad = AktifKullanici.Soyad,
                    Sifre = sifre.Text,
                    OlusturmaTarihi = AktifKullanici.OlusturmaTarihi
                    
                });
                X.Msg.Alert("Sifre Değişimi","Şifreniz Başarıyla Değiştirilmiştir").Show();
            }
            else
            {
                X.Msg.Alert("Şifre Hatası","Şifreler Eşleşmemektedir").Show();

            }
        }
    }
}