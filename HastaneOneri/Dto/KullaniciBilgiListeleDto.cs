using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HastaneOneriEntity.Enums;

namespace HastaneOneri.Dto
{
    public class KullaniciBilgiListeleDto
    {
        public int Id { get; set; }
        public int? KurumId { get; set; }
        public string KurumAdi { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string GirisAd { get; set; }
        public string Sifre { get; set; }
        public KullanciRol Rol { get; set; }
        public int BirlikId { get; set; }
        public string BirlikAdi { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
    }
}
