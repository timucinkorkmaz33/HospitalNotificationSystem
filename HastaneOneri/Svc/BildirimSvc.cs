using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HastaneOneri.Dto;
using HastaneOneriEntity.Entity;
using HastaneOneriEntity.Enums;

namespace HastaneOneri.Svc
{
    public class BildirimSvc
    {

        public void LogBilgisi(BildirimLog log)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.LogBilgisi(log);
        }

        public void LogGuncelle(BildirimLog log)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.LogGuncelle(log);
        }

        public KurumDto GetKurumBySkrsId(int id)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumBySkrsId(id);
        }

        public KurumDto GetKurumById(int id)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumById(id);
        }

        public KurumDto GetKurumByDns(string dnsName)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumByDns(dnsName);
        }

        public KurumDto GetKurumByKurumId(int kurumId)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumByKurumId(kurumId);
        }

        public List<Dto.BirlikDto> BirlikAl()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetBirlikList();
        }

        public List<KurumDto> KullaniciKurumSorgula()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.KullaniciKurumSorgula();
        }

        public List<Dto.BirimDto> birimal()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetBirimList();
        }

        public List<Dto.KurumDto> kurumno(Kullanici kul)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumList(kul);
        }

        public List<Dto.GrupDto> grupal()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetGrupList();
        }

        public List<Dto.KurumDto> kurumal(Kullanici kul)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumList(kul);
        }

        public void setbildirim(BildirimDto bildirim)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.BildirimEkle(bildirim);
        }

        public List<Dto.KurumDto> GetKurumListByKullanici(Kullanici kullanici)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumListByKullanici(kullanici);
        }

        public void setkurumekle(KurumDto kurum)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KurumEkle(kurum);
        }

        public void Guncelle(Dto.KurumDto qry)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KurumGuncelle(qry);
        }

        public void sil(int kurumid)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KurumSil(kurumid);
        }

        public List<Dto.KullaniciKurumYetkiDto> BirlikYoneticicilistele(Kullanici kullanici)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BirlikYoneticicilistele(kullanici);
        }


        public void setkullaniciekle(Kullanici kullanici)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciEkle(kullanici);
        }

        public int KullaniciIdSorgula(string girisAdi, string kullaniciSifre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.KullaniciIdSorgula(girisAdi, kullaniciSifre);
        }

        public void setkullaniciyetkiekle(KullaniciKurumYetkiDto kurumyetki)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciYetkiEkle(kurumyetki);
        }

        public void kullanicisil(int? qry)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciSil(qry);
        }

        public void kullaniciguncelle(Kullanici qry)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciGuncelle(qry);
        }

        public void kullaniciyetkiguncelle(KullaniciKurumYetkiDto qry)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciYetkiGuncelle(qry);
        }

        public List<KullaniciBilgiListeleDto> KullaniciListele(Kullanici kul)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.KullaniciListele(kul);
        }

        public void bildirimcevapla(BildirimDto bildirim)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.BildirimCevapla(bildirim);
        }

        public Kullanici logingiris(string kullaniciadi, string sifre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.KullaniciGirisKontrol(kullaniciadi, sifre);
        }

        public void sifredegistir(Kullanici qry)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.SifreDegistir(qry);
        }

        //public List<BildirimDto> kullanicibildirimistatistik(int kurumid, DateTime baslangic, DateTime bitis, int konu,int durum)
        //{
        //    var fcd = new HastaneOneri.Facade.FacadeBildirim();
        //    return fcd.kullanicibildirimistatistik(kurumid, baslangic, bitis, konu,durum);
        //}
        public List<BildirimSayisiDto> IstatistikBildirimSayisi(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.AylaraGoreBildirimSayilari(kul, filtre);
        }

        public List<TurBildirimSayisiDto> TurBildirimSayisi(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.TurBildirimSayisi(kul, filtre);
        }

        public List<CevaplananBildiriDto> CevaplananBildiriler(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.CevaplananBildiriler(kul, filtre);
        }

        public List<BildirimDto> BildirimlerimiListele(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BildirimlerimiListele(kul, filtre);
        }

        public List<BildirimDto> BildirimlerimSorgula(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BildirimlerimSorgula(kul, filtre);
        }

        public int BildirimlerimSay(Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BildirimlerimSay(kul, filtre);
        }

        public string BildirimEPostaAl(int id)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BildirimEPostaAl(id);
        }

        public int? GetKurumIdByBildirimId(int id)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.GetKurumIdByBildirimId(id);
        }

        public List<Dto.BirlikDto> BirlikListele()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BirlikListele();
        }

        public void birlikekle(BirlikDto birlikekle)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.BirlikEkle(birlikekle);
        }

        public void birliksil(int birlikId)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.BirlikSil(birlikId);
        }

        public void birlikguncelle(Dto.BirlikDto birlik)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.BirlikGuncelle(birlik);
        }

        public int cevapsizbildirisayisi()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.CevapsizBildiriSayisi();
        }

        public int cevapsizbildirisayisikullanici(int kurumid)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.CevapsizBildiriSayisiKullanici(kurumid);
        }

        public int[] beklemegunsayisi()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BeklemeGunSayisi();
        }

        public void yetkiekle(KullaniciKurumYetkiDto kurumyetki)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciKurumYetkiEkle(kurumyetki);
        }

        public void kullaniciyetkisil(int kullaniciId)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciKurumYetkiSil(kullaniciId);
        }

        public List<KullaniciBilgiListeleDto> SilinenKullaniciListele()
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.SilinenKullaniciListele();
        }

        public void KullaniciAktiflestir(int? kullaniciId)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            fcd.KullaniciAktiflestir(kullaniciId);
        }

        public List<PersoneEtkenDto> PersonelEtkenSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.PersonelEtkenSayi(deger, kul, filtre);
        } 
        public List<PersoneEtkenDto> SistemEtkenSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.SistemEtkenSayi(deger, kul, filtre);
        }
        public List<PersoneEtkenDto> BasvuruKanalSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BasvuruKanalSayi(deger, kul, filtre);
        }
        public List<PersoneEtkenDto> IcerikSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.IcerikSayi(deger, kul, filtre);
        }
        public List<PersoneEtkenDto> SonucSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.SonucSayi(deger, kul, filtre);
        }
        public List<PersoneEtkenDto> BirimSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
            return fcd.BirimSayi(deger, kul, filtre);
        }

         public void BildirimSil(int BildirimId) 
        {
            var fcd = new HastaneOneri.Facade.FacadeBildirim();
             fcd.BildirimSil(BildirimId);
        }
    }
}
