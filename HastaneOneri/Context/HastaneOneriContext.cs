using HastaneOneriEntity.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace HastaneOneri.Context
{
    public class HastaneOneriContext : DbContext
    {
        public HastaneOneriContext()
            : base("name=ConnectionString")
        {
        }
        public DbSet<Bildirim> Bildirimler { get; set; }
        public DbSet<Birim> Birimler { get; set; }
        public DbSet<Birlik> Birlikler { get; set; }
        public DbSet<Grup> Gruplar { get; set; }
        public DbSet<KullaniciKurumYetki> KullaniciKurumYetkiler { get; set; }
        public DbSet<Kullanici> Kullanicilar { get; set; }
        public DbSet<Kurum> Kurumlar { get; set; }
        public DbSet<BildirimLog> BildirimLoglar { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Kullanici>().HasMany(p => p.Yetkiler).WithMany(t=>t.)
        }
    }
}
