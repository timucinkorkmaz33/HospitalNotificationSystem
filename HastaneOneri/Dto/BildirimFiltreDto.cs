using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HastaneOneri.Enums;
using HastaneOneriEntity.Enums;

namespace HastaneOneri.Dto
{
    public class BildirimFiltreDto
    {
        public DateTime BaslangicTarihi { get; set; }
        public DateTime BitisTarihi { get; set; }
       
        public int? KurumId { get; set; }
        public BildirimTuru? Tur { get; set; }
        public int? CevapDurumu { get; set; }
        public BildirimFiltreDto()
        {
            BaslangicTarihi = DateTime.Now.AddMonths(-3);
            BitisTarihi = DateTime.Now.AddDays(1);

        }
        public int[] AyList { get; set; }
        public int[] YilList { get; set; }
        public int[] KurumList { get; set; }
        public BildirimTuru[] TurList { get; set; }
        public PersonelEtken[] PersonelEtken { get; set; }
        public SistemEtken[] SistemEtken { get; set; }
        
    }
}
