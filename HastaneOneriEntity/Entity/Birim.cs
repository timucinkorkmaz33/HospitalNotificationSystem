using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("birimler")]
    public class Birim:AbstractEntity
    {
       
        [Column("Adi")]
        public string Adi { get; set; }
       
    }
}