using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("birlikler")]
    public class Birlik:AbstractEntity
    {
        [Column("Adi")]
        public string Adi { get; set; }
        [Column("Ilkodu")]
        public int? Ilkodu { get; set; }
      
    }
}