using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using HastaneOneri.Dto;
using HastaneOneriEntity.Entity;
using HastaneOneriEntity.Enums;

namespace HastaneOneriWeb
{
    public partial class YeniKullanici : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BildirimFiltreDto filtreDto = new BildirimFiltreDto();
            birimstore.DataSource = BldSvc.BirlikAl();
            birimstore.DataBind();
            kurumstore.DataSource = BldSvc.kurumal(AktifKullanici);
            kurumstore.DataBind();
            if (AktifKullanici.Rol == KullanciRol.BirlikYönetici)
            {
                
                Rol.Items.Add(new Ext.Net.ListItem("BirlikYönetici", "2"));
                Rol.Items.Add(new Ext.Net.ListItem("Kullanici", "1"));
            }
            else if (AktifKullanici.Rol == KullanciRol.SysAdmin)
            {
                Rol.Items.Add(new Ext.Net.ListItem("SysAdmin", "0"));
                Rol.Items.Add(new Ext.Net.ListItem("BirlikYönetici", "2"));
                Rol.Items.Add(new Ext.Net.ListItem("Kullanici", "1")); 
            }
        }

        [DirectMethod(Namespace = "Ekle")]
        public void ekle()
        {
           
            BldSvc.setkullaniciekle(new Kullanici
            {
                Ad = Ad.Text,
                BirlikId =AktifKullanici.BirlikId,
                GirisAd = GirisAdi.Text,
                OlusturmaTarihi = DateTime.Now,
                Sifre = Sifre.Text,
                Soyad = Soyad.Text,
                KurumId = Convert.ToInt32(KurumKodu.SelectedItem.Value),
                Rol = (KullanciRol) Convert.ToInt32(Rol.SelectedItem.Value)
            });

            var yeniKullaniciId = BldSvc.KullaniciIdSorgula(GirisAdi.Text, Sifre.Text);

            BldSvc.setkullaniciyetkiekle(new KullaniciKurumYetkiDto
            {
                KurumId = Convert.ToInt32(KurumKodu.SelectedItem.Value),
                OlusturmaTarihi = DateTime.Now,
                KullaniciId = yeniKullaniciId

            });
            X.Msg.Alert("Kayıt İşlemi", "Kayıt Başarıyla Yapılmıştır").Show();

        }
    }
}