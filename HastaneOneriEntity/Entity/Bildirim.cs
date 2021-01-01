using HastaneOneriEntity.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("bildirimler")]
    public class Bildirim : AbstractEntity
    {

        public Bildirim()
        {
            Durum = 0;
        }

        [Column("KurumId")]
        public int? KurumId { get; set; }
        [Column("KullaniciId")]
        public int KullaniciId { get; set; } //eğer web sitesinden girilmişse 0 yap
        [Column("Konu")]
        public string Konu { get; set; }
        [Column("Mesaj")]
        public string Mesaj { get; set; }
        [Column("BasvuruYolu")]
        public BasvuruYolu BasvuruYolu { get; set; }
        [Column("Tur")]
        public BildirimTuru Tur { get; set; }
        [Column("Tarih")]
        public DateTime Tarih { get; set; }
        [Column("EPosta")]
        public string EPosta { get; set; }
        [Column("Gsm")]
        public string Gsm { get; set; }
        [Column("TcId")]
        public string TcId { get; set; }
        [Column("Ad")]
        public string Ad { get; set; }
        [Column("Soyad")]
        public string Soyad { get; set; }

        [Column("Ip")]
        public string Ip { get; set; }
        [Column("UserAgent")]
        public string UserAgent { get; set; }
        [Column("GrupId")]
        public int? GrupId { get; set; }
        [Column("BirimId")]
        public int? BirimId { get; set; }
        [Column("Durum")]
        public int Durum { get; set; }//cevap durumu
        [Column("CevapTarihi")]
        public DateTime? CevapTarihi { get; set; }
        [Column("CevapMesaji")]
        public string CevapMesaji { get; set; }
        [Column("CevapVerenId")]
        public int? CevapVerenId { get; set; }
        [Column("CevapYolu")]
        public CevapYolu? CevapYolu { get; set; }

        [ForeignKey("KurumId")]
        public virtual Kurum Kurum { get; set; }
        [ForeignKey("GrupId")]
        public virtual Grup Grup { get; set; }
        [ForeignKey("BirimId")]
        public virtual Birim Birim { get; set; }
        [ForeignKey("CevapVerenId")]
        public virtual Kullanici CevapVerenKullanici { get; set; }
        [Column("PersonelEtken")]
        public PersonelEtken? PersonelEtken { get; set; }
        [Column("SistemEtken")]
        public SistemEtken? SistemEtken { get; set; }

        [Column("Sonuc")]
        public Sonuc? Sonuc { get; set; }
        [Column("BasvuruNo")]
        public int? BasvuruNo { get; set; }
    }
}