using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HastaneOneri.Dto
{
    public class KullaniciKurumYetkiDto
    {
        public int Id { get; set; }
        public int? KullaniciId { get; set; }
        public string KullaniciAdi { get; set; }
        public int KurumId { get; set; }
        public string KurumAdi { get; set; }
        public List<int?> KurumIdList { get; set; }
        public bool Aktif { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
        
    }
}