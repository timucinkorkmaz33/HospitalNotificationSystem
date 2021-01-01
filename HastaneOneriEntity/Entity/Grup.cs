using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("gruplar")]
    public class Grup:AbstractEntity
    {
        [Column("Adi")]
        public string Adi { get; set; }
     
    }
}