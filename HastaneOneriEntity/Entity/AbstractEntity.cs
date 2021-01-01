using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HastaneOneriEntity.Entity
{
    public abstract class AbstractEntity
    {
        [Column("Id"), Key]
        public int Id { get; set; }
        [Column("OlusturmaTarihi")]
        public DateTime OlusturmaTarihi { get; set; }
        [Column("Aktif")]
        public bool Aktif { get; set; }

        protected AbstractEntity()
        {
            OlusturmaTarihi=DateTime.Now;
            Aktif = true;
        }
    }
}
