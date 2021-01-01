using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HastaneOneri.Dto
{
    public class BirimDto
    {
        public int Id { get; set; }
        public string Adi { get; set; }
        public bool Aktif { get; set; }
        public DateTime OlusturmaTarihi { get; set; }
    }
}