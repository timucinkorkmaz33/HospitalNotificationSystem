using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HastaneOneri.Dto
{
    public class KurumDto
    {
        public int Id { get; set; }
        public int? BirlikId { get; set; }
        public string BirlikAdi { get; set; }
        public int? SkrsKodu { get; set; }
        public string Adi { get; set; }
        public string SMTPServer { get; set; }
        public string SMTPUser { get; set; }
        public string SMTPPass { get; set; }
        public bool Aktif { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
        public string DnsName { get; set; }
        public string EMail { get; set; }
    }
}