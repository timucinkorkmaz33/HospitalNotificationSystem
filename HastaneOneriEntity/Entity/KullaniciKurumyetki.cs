using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("kullanicikurumyetki")]
    public class KullaniciKurumYetki:AbstractEntity
    {
      
        [Column("KullaniciId")]
        public int? KullaniciId { get; set; }
        [Column("KurumId")]
        public int KurumId { get; set; }
      
    }
}