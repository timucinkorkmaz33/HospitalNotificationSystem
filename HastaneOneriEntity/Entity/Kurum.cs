using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HastaneOneriEntity.Entity
{
    [Table("kurumlar")]
    public class Kurum:AbstractEntity
    {
       
        [Column("BirlikId")]
        public int? BirlikId { get; set; }
        [Column("SkrsKodu")]
        public int? SkrsKodu { get; set; }
        [Column("Adi")]
        public string Adi { get; set; }
        [Column("SMTPServer")]
        public string SMTPServer { get; set; }
        [Column("SMTPUser")]
        public string SMTPUser { get; set; }
        [Column("SMTPPass")]
        public string SMTPPass { get; set; }
       
        [Column("DnsName")]
        public string DnsName { get; set; }
        [Column("EMail")]
        public string EMail { get; set; }
    }
}