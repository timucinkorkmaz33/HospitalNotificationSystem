using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HastaneOneri.Enums;

namespace HastaneOneri.Dto
{
   public class BildirimSayisiDto
    {
        public int Ay { get; set; }
        public string AyAdi
        {
            get
            {
                if (Ay != null)
                {
                    return ((EnumAyAdi)Ay).ToString();
                }
                return String.Empty;

            }
        }
        public int Sayi{get; set; }

        public int Yil { get; set; }
    }
}
