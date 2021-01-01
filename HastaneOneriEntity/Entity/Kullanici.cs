using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using HastaneOneriEntity.Enums;

namespace HastaneOneriEntity.Entity
{
    [Table("kullanicilar")]
    public class Kullanici:AbstractEntity
    {
      
        [Column("GirisAd")]
        public string GirisAd { get; set; }
        [Column("Sifre")]
        public string Sifre { get; set; }
        [Column("Ad")]
        public string Ad { get; set; }
        [Column("Soyad")]
        public string Soyad { get; set; }
       
        [Column("BirlikId")]
        public int BirlikId { get; set; }

        [Column("KurumId")]
        public int KurumId { get; set; }

        [ForeignKey("BirlikId")]
        public virtual Birlik Birlik { get; set; }

        [Column("Rol")]
        public KullanciRol Rol { get; set; }
       
        public virtual ICollection<KullaniciKurumYetki> KurumYetkileri { get; set; }
    } 
}