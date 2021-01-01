using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HastaneOneri.Enums;
using HastaneOneriEntity.Enums;

namespace HastaneOneri.Dto
{
    public class BildirimDto
    {
        public int Id { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
        public int? KurumId { get; set; }
        public string KurumAdi { get; set; }
        public int? KullaniciId { get; set; }
        public string Konu { get; set; }
        public string Mesaj { get; set; }
        public BasvuruYolu BasvuruYolu { get; set; }
        public BildirimTuru Tur { get; set; }
       
        public DateTime Tarih { get; set; }
        public int? BeklemeGunSayisi {
            get
            {
                if (Durum==0) return (DateTime.Today.Date - Tarih.Date).Days
                ;
                else
                {
                    return (CevapTarihi.Value.Date - Tarih.Date).Days;
                }
            }
        }
        public string EPosta { get; set; }
        public string Gsm { get; set; }
        public string TcId { get; set; }
        public string Ip { get; set; }
        public string UserAgent { get; set; }
        public int? GrupId { get; set; }
        public string GrupAd { get; set; }
        public int? BirimId { get; set; }
        public string BirimAdi { get; set; }
        public int Durum { get; set; }
        public string DurumAciklama
        {
            get
            {
                if (Durum==0) return ("Cevaplanmadı")
                ;
                else
                {
                    return ("Cevaplandı");
                }
            }
        }
        public DateTime? CevapTarihi { get; set; }
        public string CevapMesaji { get; set; }
        public int? CevapVerenId { get; set; }
        public string CevapVerenAdi { get; set; }
        public CevapYolu? CevapYolu { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public bool Aktif { get; set; }
        public int? BirlikId { get; set; }
        public string BirlikAdi { get; set; }
        public PersonelEtken? PersonelEtken { get; set; }
        public SistemEtken? SistemEtken { get; set; }
        public Sonuc? Sonuc { get; set; }
        public int? BasvuruNo { get; set; }
    }
}