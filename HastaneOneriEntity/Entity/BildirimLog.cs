using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HastaneOneriEntity.Entity
{
    [Table("bildirimlog")]
    public class BildirimLog
    {
        [Column("Id"),Key]
        public int Id { get; set; }
        [Column("KullaniciId")]
        public int KullaniciId { get; set; }
        [Column("GirisTarihi")]
        public DateTime GirisTarihi { get; set; }
        [Column("CikisTarihi")]
        public DateTime CikisTarihi { get; set; }
        [Column("Ip")]
        public string Ip { get; set; }
        [Column("UserAgent")]
        public string UserAgent { get; set; } 
        [Column("SessionId")]
        public string SessionId { get; set; }

    }
}
