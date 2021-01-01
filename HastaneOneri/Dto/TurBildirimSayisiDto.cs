using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HastaneOneri.Enums;
using HastaneOneriEntity.Enums;

namespace HastaneOneri.Dto
{
    public class TurBildirimSayisiDto
    {
        public int BILDIRIMTURSAYISI { get; set; }
        public BildirimTuru BILDIRIMTUR { get; set; }
        public string TurAciklama
        {
            get
            {
                if (BILDIRIMTUR != null)
                {
                    return ((BildirimTuru)BILDIRIMTUR).ToString();
                }
                return String.Empty;

            }
        }
    }
}
