using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using HastaneOneri.Dto;
using HastaneOneri.Enums;
using HastaneOneriEntity.Entity;
using HastaneOneriEntity.Enums;
using LibKRMD.Utils;

namespace HastaneOneri.Facade
{
    public class FacadeBildirim
    {
        private HastaneOneri.Context.HastaneOneriContext Context = new Context.HastaneOneriContext();

        public void LogBilgisi(BildirimLog log)
        {

            var ent = Context.BildirimLoglar.FirstOrDefault(x => x.Id == log.Id);
            if (ent == null)
            {
                ent = new BildirimLog();

                Context.BildirimLoglar.Add(ent);
            }

            ent.CikisTarihi = log.CikisTarihi;
            ent.GirisTarihi = log.GirisTarihi;
            ent.SessionId = log.SessionId;
            ent.Ip = log.Ip;
            ent.KullaniciId = log.KullaniciId;
            ent.UserAgent = log.UserAgent;

            Context.SaveChanges();
        }
        public void LogGuncelle(BildirimLog log)
        {
            var ent = Context.BildirimLoglar.FirstOrDefault(x => x.SessionId == log.SessionId);
            if (ent == null)
            {
                ent = new BildirimLog();
                ent.KullaniciId = log.KullaniciId;
                ent.GirisTarihi = log.GirisTarihi;
                ent.SessionId = log.SessionId;
                Context.BildirimLoglar.Add(ent);
            }

            ent.CikisTarihi = log.CikisTarihi;

            ent.Ip = log.Ip;
            ent.UserAgent = log.UserAgent;
            Context.SaveChanges();

        }
        public List<Dto.BirlikDto> GetBirlikList()
        {
            var sorgu = from i in Context.Birlikler
                        select new Dto.BirlikDto()
                        {

                            Adi = i.Adi,
                            Id = i.Id

                        };
            var result = sorgu.ToList();
            return result;
        }
        public List<Dto.BirimDto> GetBirimList()
        {
            var sorgu = from i in Context.Birimler
                        select new Dto.BirimDto()
                        {

                            Adi = i.Adi,
                            Id = i.Id

                        };
            var result = sorgu.ToList();
            return result;
        }
        public List<KurumDto> KullaniciKurumSorgula()
        {
            //var sorgu = Context.KullaniciKurumYetkiler.Where(p => (p.KullaniciId ?? 0) == id).Select(q => q.KurumId);

            var sorgu = from i in Context.KullaniciKurumYetkiler
                        join s in Context.Kurumlar on i.KurumId equals s.Id

                        select new KurumDto()
                        {
                            Adi = s.Adi,
                            Id = s.Id
                        };
            var sonuc = sorgu.ToList();
            return sonuc;
        }
        public KurumDto GetKurumBySkrsId(int skrsId)
        {

            var sorgu = from i in Context.Kurumlar
                        where i.SkrsKodu == skrsId
                        select new KurumDto()
                        {
                            Id = i.Id,
                            OlusturmaTarihi = i.OlusturmaTarihi,
                            BirlikId = i.BirlikId,
                            DnsName = i.DnsName,
                            SkrsKodu = i.SkrsKodu,
                            Adi = i.Adi,
                            Aktif = i.Aktif,
                            EMail = i.EMail,
                            SMTPPass = i.SMTPPass,
                            SMTPServer = i.SMTPServer,
                            SMTPUser = i.SMTPUser
                        };
            var sonuc = sorgu.FirstOrDefault();
            return sonuc;
        }
        public List<KullaniciBilgiListeleDto> SilinenKullaniciListele()
        {
            var sorgu = from s in Context.Kullanicilar
                        where s.Aktif == false
                        join br in Context.Birlikler on s.BirlikId equals br.Id into j1
                        from br in j1.DefaultIfEmpty()
                        select new KullaniciBilgiListeleDto()
                        {
                            Id = s.Id,
                            KurumId = s.KurumId,
                            Ad = s.Ad,
                            Soyad = s.Soyad,
                            GirisAd = s.GirisAd,
                            Sifre = s.Sifre,
                            Rol = s.Rol,
                            BirlikId = s.BirlikId,
                            OlusturmaTarihi = s.OlusturmaTarihi,
                            BirlikAdi = br.Adi
                        };

            var sonuc = sorgu.ToList();
            return sonuc;
        }
        public void KullaniciAktiflestir(int? kullaniciId)
        {
            var kullanici = Context.Kullanicilar.FirstOrDefault(p => p.Id == kullaniciId);

            kullanici.Aktif = true;

            Context.SaveChanges();
        }
        public KurumDto GetKurumById(int id)
        {
            var sorgu = from i in Context.Kurumlar
                        where i.Id == id
                        select new KurumDto()
                        {
                            Id = i.Id,
                            OlusturmaTarihi = i.OlusturmaTarihi,
                            BirlikId = i.BirlikId,
                            DnsName = i.DnsName,
                            SkrsKodu = i.SkrsKodu,
                            Adi = i.Adi,
                            Aktif = i.Aktif,
                            EMail = i.EMail,
                            SMTPPass = i.SMTPPass,
                            SMTPServer = i.SMTPServer,
                            SMTPUser = i.SMTPUser
                        };
            var sonuc = sorgu.FirstOrDefault();
            return sonuc;
        }
        public List<Dto.KurumDto> GetKurumSkrsList()
        {
            var sorgu = from s in Context.Kurumlar
                        select new KurumDto()
                        {

                            Adi = s.Adi,
                            SkrsKodu = s.SkrsKodu
                        };
            var sonuc = sorgu.ToList();
            return sonuc;
        }
        public List<Dto.KurumDto> GetKurumList(Kullanici kullanici)
        {
            var sorgu = from i in Context.Kurumlar
                        where i.Aktif
                        select new Dto.KurumDto()
                        {
                            Adi = i.Adi,
                            Id = i.Id
                        };
            switch (kullanici.Rol)
            {
                case KullanciRol.BirlikYönetici:
                    break;
                case KullanciRol.SysAdmin:
                    break;
                case KullanciRol.Kullanici:
                    sorgu = sorgu.Where(p => Context.KullaniciKurumYetkiler.Any(y => y.KurumId == p.Id));
                    break;
            }
            var result = sorgu.ToList();
            return result;
        }
        public List<Dto.GrupDto> GetGrupList()
        {

            var sorgu = from s in Context.Gruplar
                        select new Dto.GrupDto()
                        {
                            Id = s.Id,
                            Adi = s.Adi
                        };
            var result = sorgu.ToList();
            return result;
        }
        public int CevapsizBildiriSayisi()
        {
            var sorgu = (from c in Context.Bildirimler
                         where c.CevapMesaji == null
                         select c).Count();
            return sorgu;
        }
        public int CevapsizBildiriSayisiKullanici(int kurumid)
        {
            var sorgu = (from c in Context.Bildirimler
                         where c.CevapMesaji == null && c.KurumId == kurumid
                         select c).Count();
            return sorgu;
        }
        public int[] BeklemeGunSayisi()
        {

            var sorgu = (from c in Context.Bildirimler
                         where c.CevapMesaji == null
                         select (c.Tarih));

            int mesajsayisi = sorgu.Count();
            int[] bildiribeklemegunu = new int[mesajsayisi];

            var x = sorgu.ToList();

            for (int a = 0; a < mesajsayisi; a++)
            {

                bildiribeklemegunu[a] = (DateTime.Today.Date - x[a].Date).Days;
            }
            return bildiribeklemegunu;
        }
        public List<BildirimSayisiDto> AylaraGoreBildirimSayilari(Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);

            var grp = qry.Select(p => new { Ay = p.Tarih.Month, Yil = p.Tarih.Year, p.Id }).GroupBy(g => new { g.Ay, g.Yil }).Select(p => new BildirimSayisiDto { Ay = p.Key.Ay, Yil = p.Key.Yil, Sayi = p.Count() });

            var result = grp.ToList();

            return result;
        }
        public List<TurBildirimSayisiDto> TurBildirimSayisi(Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);

            var grp = qry.Select(p => new { BILDIRIMTUR = p.Tur, p.Id }).GroupBy(g => new { g.BILDIRIMTUR }).Select(p => new TurBildirimSayisiDto { BILDIRIMTUR = p.Key.BILDIRIMTUR, BILDIRIMTURSAYISI = p.Count() });

            var result = grp.ToList();
            return result;
        }
        public List<CevaplananBildiriDto> CevaplananBildiriler(Kullanici kul, BildirimFiltreDto filtre)
        {
            List<CevaplananBildiriDto> list = new List<CevaplananBildiriDto>();
            var qry = GetBildirimQuery(kul, filtre);
            var cevapsiz = qry.Where(p => p.Durum == 0).Count();
            var cevaplanan = qry.Where(p => p.Durum == 1).Count();

            list.Add(new CevaplananBildiriDto
            {
                CevaplananBildiriSayisi = cevaplanan,
                Tur = "Cevaplanan"
            });

            list.Add(new CevaplananBildiriDto
            {
                CevaplananBildiriSayisi = cevapsiz,
                Tur = "Cevaplanmayan"
            });


            return list;


        }
        public string BildirimEPostaAl(int id)
        {
            var sorgu = (from c in Context.Bildirimler
                         where c.Id == id
                         select c.EPosta).FirstOrDefault();
            return sorgu;
        }
        private IQueryable<Bildirim> GetBildirimQuery(Kullanici kullanici, BildirimFiltreDto filtre)
        {
            var qry = Context.Bildirimler.AsQueryable();

            switch (kullanici.Rol)
            {
                case KullanciRol.Kullanici:
                    qry =
                        qry.Where(p => Context.KullaniciKurumYetkiler.Any(y => y.KurumId == p.KurumId && y.KullaniciId == kullanici.Id));
                    break;
                case KullanciRol.BirlikYönetici:
                    qry =
                       qry.Where(p => Context.Kurumlar.Any(k => k.Id == p.KurumId && k.BirlikId == kullanici.BirlikId));
                    break;
                case KullanciRol.SysAdmin:
                    break;
            }
            if (filtre.YilList != null)
            {
                qry = qry.Where(p => filtre.YilList.Contains(p.Tarih.Year));
            }

            if (filtre.AyList != null)
            {
                qry = qry.Where(p => filtre.AyList.Contains(p.Tarih.Month));
            }
            if (filtre.KurumList != null)
            {
                qry = qry.Where(p => filtre.KurumList.Contains(p.KurumId ?? 0));
            }


            if (filtre.BaslangicTarihi != null && filtre.BitisTarihi != null)
            {
                qry = qry.Where(p => p.Tarih >= filtre.BaslangicTarihi && p.Tarih <= filtre.BitisTarihi);
            }
            if (filtre.KurumId != null)
            {
                qry = qry.Where(p => p.KurumId == filtre.KurumId);
            }

            if (filtre.CevapDurumu != null)
            {
                qry = qry.Where(p => p.Durum == filtre.CevapDurumu);
            }

            if (filtre.Tur != null)
            {
                qry = qry.Where(p => p.Tur == filtre.Tur);
            }

            if (filtre.PersonelEtken != null)
            {
                qry = qry.Where(p => filtre.PersonelEtken.Contains(p.PersonelEtken ?? 0));
                var sonuc = qry.Count();

            }

            if (filtre.SistemEtken != null)
            {
                qry = qry.Where(p => filtre.SistemEtken.Contains(p.SistemEtken ?? 0));
            }


            if (filtre.TurList != null)
            {
                qry = qry.Where(p => filtre.TurList.Contains(p.Tur));
            }

            return qry;
        }
        public List<PersoneEtkenDto> PersonelEtkenSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            int[] sorgu = new int[12];
            deger = 0;
            for (deger = 1; deger < 12; deger++)
            {
                sorgu[deger] = qry.Where(p => p.PersonelEtken == (PersonelEtken)deger).Count();
            }
            string[] EtkenAdi ={"Yok","Diğer",
         "Diğer Çalışan",
         "Güvenlik",
         "Hekim",
         "Hemşire",
         "Sekreter",
         "Temizlik Personeli",
         "Tüm Personel",
         "Üst Yönetim",
         "Yardımcı Sağlık Personeli","Danışma Personeli"};

            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < 12; deger++)
            {
                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = EtkenAdi[deger],
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<PersoneEtkenDto> SistemEtkenSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            int[] sorgu = new int[33];
            deger = 0;
            for (deger = 1; deger < 33; deger++)
            {
                sorgu[deger] = qry.Where(p => p.SistemEtken == (SistemEtken)deger).Count();
            }
            string[] EtkenAdi ={"Yok","Başvuruve Dava Edememe",
        "Bilgilendirilmiş Rızanın alınmaması",
        "Diğer",
        "Dini Vecibelerini Yerine Getirememe",
        "Ekipman Yetersizliği",
        "Fiziki Altyapı",
        "Güvenliğin Sağlanmaması",
        "Hizmete Geç Ulaşım",
        "Hizmetten Genel Olarak Yararlanamama",
        "Iletişim Bozukluğu",
        "Mahremiyete uyulmaması",
        "Memnuniyet",
        "Mhrs Hastane Randevu Sistemi",
        "Mobbing",
        "Otelcilik Hizmetleri",
        "Pers. çalışma koşulları maaş sorunu özlük hk",
        "Personel Yetersizliği",
        "SağKur Persnl Seçmeme Değiştirememe",
        "Saygınlık Ve Rahatlık Görememe",
        "Teknik Sorunlar",
        "Tıbbi Malzeme Olmaması",
        "Tıbbi Müdahele Sorunlar",
        "Yeterli Bilgilendirilmeme",
        "Ziyaretçi Kabul edememe Refakatçi bulundurumama","Hekimin tedavi yöntemine  müdahale",
        "Hastanın nitelikli hizmet alamadığı iddası","Tedavi talebi",
        "Bilgi belge güvenliğinin sağlanamaması","Hastanenin İşleyiş kurallarına uygun olmayan talepleri","Tıbbi malzeme bedelleri",
        "SGK ile ilgili sorunlar","Muayene prosedürüne uymama"};

            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < 33; deger++)
            {
                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = EtkenAdi[deger],
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<PersoneEtkenDto> BasvuruKanalSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            int[] sorgu = new int[11];
            deger = 0;
            for (deger = 1; deger < 11; deger++)
            {
                sorgu[deger] = qry.Where(p => p.BasvuruYolu == (BasvuruYolu)deger).Count();
            }
            string[] EtkenAdi ={"Yok","WebSite",
        "Bilgi Edinme",
        "Bimer",
        "Diğer",
        "Dilek Öneri Kutuları",
        "Dilekçe",
        "EMail",
        "Hasta Hakları",
        "Il Sağlık Müd",
        "Sabim"};

            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < 11; deger++)
            {
                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = EtkenAdi[deger],
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<PersoneEtkenDto> IcerikSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            int[] sorgu = new int[7];
            deger = 0;
            for (deger = 1; deger < 7; deger++)
            {
                sorgu[deger] = qry.Where(p => p.Tur == (BildirimTuru)deger).Count();
            }
            string[] EtkenAdi ={"Yok"," Bilgi Edinme",
        "Diğer",
        "Görüş isteme",
        "Şikayet",
        "Talep Öneri",
        "Teşekkür"};

            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < 7; deger++)
            {
                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = EtkenAdi[deger],
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<PersoneEtkenDto> SonucSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            int[] sorgu = new int[9];
            deger = 0;
            for (deger = 1; deger < 9; deger++)
            {
                sorgu[deger] = qry.Where(p => p.Sonuc == (Sonuc)deger).Count();
            }
            string[] EtkenAdi ={"Yok","Adli Konu",
        "Başvuran Haklı",
        "Değerlendirmede",
        "Diğer",
        "Hasta Hak ihlali var",
        "Hasta Hak Ihlali yok",
        "Kapsam Dışı",
        "Kurum Haklı"};

            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < 9; deger++)
            {
                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = EtkenAdi[deger],
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<PersoneEtkenDto> BirimSayi(int deger, Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            float saydir = qry.Count();
            float yuzdedilim = ((100) / saydir);
            yuzdedilim = (float)Math.Round(yuzdedilim, 2);
            var birimsayi = (from i in Context.Birimler select i).Count();
            int[] sorgu = new int[birimsayi + 1];
            deger = 0;
            for (deger = 1; deger < birimsayi + 1; deger++)
            {
                sorgu[deger] = qry.Where(p => p.BirimId == deger).Count();
            }
            List<PersoneEtkenDto> result = new List<PersoneEtkenDto>();
            for (deger = 1; deger < birimsayi + 1; deger++)
            {
                var adi = (from c in Context.Birimler where c.Id == deger select c.Adi).FirstOrDefault();



                result.Add(new PersoneEtkenDto()
                {
                    BildirimSayi = sorgu[deger],
                    EtkenAdi = adi,
                    BildirimYuzdesi = "%" + sorgu[deger] * yuzdedilim
                });
            }
            var sonuc = result.ToList();
            return sonuc;
        }
        public List<BildirimDto> BildirimlerimiListele(Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            var q2 = from s in qry
                     join br in Context.Kurumlar on s.KurumId equals br.Id into j1
                     from br in j1.DefaultIfEmpty()
                     join brlk in Context.Birlikler on br.BirlikId equals brlk.Id into j2
                     from brlk in j2.DefaultIfEmpty()
                     where s.Aktif==true
                     select new Dto.BildirimDto()
                     {
                         BasvuruYolu = s.BasvuruYolu,
                         BirimId = s.BirimId,
                         CevapMesaji = s.CevapMesaji,
                         CevapTarihi = s.CevapTarihi,
                         CevapVerenId = s.CevapVerenId,
                         CevapYolu = s.CevapYolu,
                         Durum = s.Durum,
                         EPosta = s.EPosta,
                         GrupId = s.GrupId,
                         Gsm = s.Gsm,
                         Ip = s.Ip,
                         Konu = s.Konu,
                         TcId = s.TcId,
                         Ad = s.Ad + " " + s.Soyad,
                         Soyad = s.Soyad,
                         Mesaj = s.Mesaj,
                         KullaniciId = s.KullaniciId,
                         KurumId = s.KurumId,
                         OlusturmaTarihi = s.OlusturmaTarihi,
                         Tarih = s.Tarih,
                         Tur = s.Tur,
                         UserAgent = s.UserAgent,
                         Id = s.Id,
                         GrupAd = s.Grup.Adi,
                         BirimAdi = s.Birim.Adi,
                         CevapVerenAdi = s.CevapVerenKullanici.GirisAd,
                         KurumAdi = s.Kurum.Adi,
                         BirlikId = br.BirlikId,
                         BirlikAdi = brlk.Adi,
                         PersonelEtken = s.PersonelEtken,
                         SistemEtken = s.SistemEtken,
                         Sonuc = s.Sonuc,
                         BasvuruNo = s.BasvuruNo

                     };

            var result = q2.ToList();
            return result;
        }
        public List<BildirimDto> BildirimlerimSorgula(Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            var q2 = from s in qry
                     join br in Context.Kurumlar on s.KurumId equals br.Id into j1
                     from br in j1.DefaultIfEmpty()
                     join brlk in Context.Birlikler on br.BirlikId equals brlk.Id into j2
                     from brlk in j2.DefaultIfEmpty()
                     select new Dto.BildirimDto()
                     {
                         BasvuruYolu = s.BasvuruYolu,
                         BirimId = s.BirimId,
                         CevapMesaji = s.CevapMesaji,
                         CevapTarihi = s.CevapTarihi,
                         CevapVerenId = s.CevapVerenId,
                         CevapYolu = s.CevapYolu,
                         Durum = s.Durum,
                         EPosta = s.EPosta,
                         GrupId = s.GrupId,
                         Gsm = s.Gsm,
                         Ip = s.Ip,
                         Konu = s.Konu,
                         TcId = s.TcId,
                         Ad = s.Ad + " " + s.Soyad,
                         Soyad = s.Soyad,
                         Mesaj = s.Mesaj,
                         KullaniciId = s.KullaniciId,
                         KurumId = s.KurumId,
                         OlusturmaTarihi = s.OlusturmaTarihi,
                         Tarih = s.Tarih,
                         Tur = s.Tur,
                         UserAgent = s.UserAgent,
                         Id = s.Id,
                         GrupAd = s.Grup.Adi,
                         BirimAdi = s.Birim.Adi,
                         CevapVerenAdi = s.CevapVerenKullanici.GirisAd,
                         KurumAdi = s.Kurum.Adi,
                         BirlikId = br.BirlikId,
                         BirlikAdi = brlk.Adi,
                         PersonelEtken = s.PersonelEtken,
                         SistemEtken = s.SistemEtken
                     };

            var result = q2.ToList();
            return result;
        }
        public int BildirimlerimSay(Kullanici kul, BildirimFiltreDto filtre)
        {
            var qry = GetBildirimQuery(kul, filtre);
            var q2 = from s in qry
                     join br in Context.Kurumlar on s.KurumId equals br.Id into j1
                     from br in j1.DefaultIfEmpty()
                     join brlk in Context.Birlikler on br.BirlikId equals brlk.Id into j2
                     from brlk in j2.DefaultIfEmpty()
                     select new Dto.BildirimDto()
                     {
                         BasvuruYolu = s.BasvuruYolu,
                         BirimId = s.BirimId,
                         CevapMesaji = s.CevapMesaji,
                         CevapTarihi = s.CevapTarihi,
                         CevapVerenId = s.CevapVerenId,
                         CevapYolu = s.CevapYolu,
                         Durum = s.Durum,
                         EPosta = s.EPosta,
                         GrupId = s.GrupId,
                         Gsm = s.Gsm,
                         Ip = s.Ip,
                         Konu = s.Konu,
                         TcId = s.TcId,
                         Ad = s.Ad + " " + s.Soyad,
                         Soyad = s.Soyad,
                         Mesaj = s.Mesaj,
                         KullaniciId = s.KullaniciId,
                         KurumId = s.KurumId,
                         OlusturmaTarihi = s.OlusturmaTarihi,
                         Tarih = s.Tarih,
                         Tur = s.Tur,
                         UserAgent = s.UserAgent,
                         Id = s.Id,
                         GrupAd = s.Grup.Adi,
                         BirimAdi = s.Birim.Adi,
                         CevapVerenAdi = s.CevapVerenKullanici.GirisAd,
                         KurumAdi = s.Kurum.Adi,
                         BirlikId = br.BirlikId,
                         BirlikAdi = brlk.Adi,
                         PersonelEtken = s.PersonelEtken,
                         SistemEtken = s.SistemEtken
                     };

            var result = q2.Count();
            return result;
        }
        public void BildirimEkle(BildirimDto bildirim)
        {

            var ent = Context.Bildirimler.FirstOrDefault(x => x.Id == bildirim.Id);
            if (ent == null)
            {
                ent = new Bildirim();

                Context.Bildirimler.Add(ent);
            }
            ent.Durum = bildirim.Durum;
            ent.Tur = bildirim.Tur;
            ent.BasvuruYolu = bildirim.BasvuruYolu;
            ent.EPosta = bildirim.EPosta;
            ent.Tarih = bildirim.Tarih;
            ent.KurumId = bildirim.KurumId;
            ent.Ad = bildirim.Ad;
            ent.Aktif = true;
            ent.Soyad = bildirim.Soyad;
            ent.TcId = bildirim.TcId;
            ent.Ip = bildirim.Ip;
            ent.UserAgent = bildirim.UserAgent;
            ent.Gsm = bildirim.Gsm;
            ent.Konu = bildirim.Konu;
            ent.GrupId = bildirim.GrupId;
            ent.BirimId = bildirim.BirimId;
            ent.Mesaj = bildirim.Mesaj;
            ent.OlusturmaTarihi = bildirim.OlusturmaTarihi;
            ent.Id = bildirim.Id;
            ent.SistemEtken = bildirim.SistemEtken;
            ent.PersonelEtken = bildirim.PersonelEtken;
            ent.BasvuruNo = bildirim.BasvuruNo;
            ent.Sonuc = bildirim.Sonuc;
            Context.SaveChanges();
        }
        public List<Dto.KurumDto> GetKurumListByKullanici(Kullanici kullanici)
        {
            var sorgu = from c in Context.Kurumlar
                        join br in Context.Birlikler on c.BirlikId equals br.Id into j1
                        from br in j1.DefaultIfEmpty()
                        where c.Aktif
                        select new Dto.KurumDto()
                        {
                            SMTPServer = c.SMTPServer,
                            Adi = c.Adi,
                            Id = c.Id,
                            BirlikId = c.BirlikId,
                            OlusturmaTarihi = c.OlusturmaTarihi,
                            Aktif = c.Aktif,
                            SMTPUser = c.SMTPUser,
                            SMTPPass = c.SMTPPass,
                            SkrsKodu = c.SkrsKodu,
                            EMail = c.EMail,
                            DnsName = c.DnsName,
                            BirlikAdi = br.Adi

                        };

            if (kullanici.Rol == KullanciRol.BirlikYönetici)
                sorgu = sorgu.Where(p => p.BirlikId == kullanici.BirlikId);
            else if (kullanici.Rol == KullanciRol.Kullanici)
                sorgu = sorgu.Where(p => p.Id == kullanici.KurumId);

            var sonuc = sorgu.ToList();
            return sonuc;
        }
        public void KurumEkle(KurumDto kurum)
        {
            var ent = Context.Kurumlar.FirstOrDefault(x => x.Id == kurum.Id);
            if (ent == null)
            {
                ent = new Kurum();

                Context.Kurumlar.Add(ent);
            }

            ent.Adi = kurum.Adi;
            // ent.Aktif = kurum.Aktif;
            ent.BirlikId = kurum.BirlikId;
            ent.SMTPPass = kurum.SMTPPass;
            ent.SMTPServer = kurum.SMTPServer;
            ent.SMTPUser = kurum.SMTPUser;
            ent.SkrsKodu = kurum.SkrsKodu;
            ent.EMail = kurum.EMail;
            ent.DnsName = kurum.DnsName;
            Context.SaveChanges();
        }
        public void KurumGuncelle(KurumDto qry)
        {
            var ent = Context.Kurumlar.FirstOrDefault(x => x.Id == qry.Id);
            if (ent == null)
            {
                ent = new Kurum();

                Context.Kurumlar.Add(ent);
            }

            ent.Adi = qry.Adi;

            ent.BirlikId = qry.BirlikId;
            ent.OlusturmaTarihi = qry.OlusturmaTarihi;
            ent.SMTPPass = qry.SMTPPass;
            ent.SMTPServer = qry.SMTPServer;
            ent.SMTPUser = qry.SMTPUser;
            ent.SkrsKodu = qry.SkrsKodu;
            ent.DnsName = qry.DnsName;
            ent.EMail = qry.EMail;
            Context.SaveChanges();

        }
        public void KurumSil(int kurumId)
        {
            var ent = Context.Kurumlar.FirstOrDefault(x => x.Id == kurumId);
            var sil = from a in Context.Kurumlar
                      where a.Id == kurumId
                      select a;

            // Context.Kurumlar.Remove(sil.FirstOrDefault());
            ent.Aktif = false;
            Context.SaveChanges();
        }
        public List<Dto.KullaniciKurumYetkiDto> BirlikYoneticicilistele(Kullanici kullanici)
        {
            var sorgu = from s in Context.KullaniciKurumYetkiler
                        join i in Context.Kullanicilar on s.KullaniciId equals i.Id into j1
                        from i in j1.DefaultIfEmpty()
                        join k in Context.Kurumlar on s.KurumId equals k.Id into j2
                        from k in j2.DefaultIfEmpty()
                        where i.BirlikId == kullanici.BirlikId && i.Rol != KullanciRol.SysAdmin
                        select new Dto.KullaniciKurumYetkiDto()
                        {
                            Id = s.Id,
                            Aktif = s.Aktif,
                            OlusturmaTarihi = s.OlusturmaTarihi,
                            KurumId = s.KurumId,
                            // KurumIdList = (Context.KullaniciKurumYetkiler.Where(p => (p.KullaniciId ?? -1) == s.Id).Select(q => q.KurumId).ToList()),
                            KullaniciId = s.KullaniciId,
                            KullaniciAdi = i.Ad + " " + i.Soyad,
                            KurumAdi = k.Adi

                        };

            var sonuc = sorgu.ToList();
            return sonuc;
        }
        public List<KullaniciBilgiListeleDto> KullaniciListele(Kullanici kullanici)
        {
            var sorgu = from s in Context.Kullanicilar
                        join br in Context.Birlikler on s.BirlikId equals br.Id into j1
                        from br in j1.DefaultIfEmpty()
                        join kr in Context.Kurumlar on s.KurumId equals kr.Id into j2
                        from kr in j2.DefaultIfEmpty()
                        where (s.Aktif)
                        select new KullaniciBilgiListeleDto
                        {
                            Id = s.Id,
                            KurumId = s.KurumId,
                            Ad = s.Ad,
                            Soyad = s.Soyad,
                            GirisAd = s.GirisAd,
                            Sifre = s.Sifre,
                            Rol = s.Rol,
                            KurumAdi=kr.Adi,
                            BirlikId = s.BirlikId,
                            OlusturmaTarihi = s.OlusturmaTarihi,
                            BirlikAdi = br.Adi
                        };
            switch (kullanici.Rol)
            {
                case KullanciRol.BirlikYönetici:
                    sorgu = sorgu.Where(p => p.BirlikId == kullanici.BirlikId && p.Rol != KullanciRol.SysAdmin);
                    break;
                case KullanciRol.SysAdmin:
                    break;
            }
            var sonuc = sorgu.ToList();
            return sonuc;


        }
        public int KullaniciIdSorgula(string girisAdi, string kullaniciSifre)
        {
            var sorgu = (from i in Context.Kullanicilar
                         where i.GirisAd == girisAdi && i.Sifre == kullaniciSifre
                         select i.Id);
            var deger = sorgu.FirstOrDefault();
            return deger;
        }
        public int? GetKurumIdByBildirimId(int id)
        {
            var sorgu = (from c in Context.Bildirimler
                         where c.Id == id
                         select c.KurumId).FirstOrDefault();
            return sorgu;
        }
        public void KullaniciEkle(Kullanici kullanici)
        {
            var ent = Context.Kullanicilar.FirstOrDefault(x => x.Id == kullanici.Id);
            if (ent == null)
            {
                ent = new Kullanici();


                Context.Kullanicilar.Add(ent);
            }

            ent.Ad = kullanici.Ad;
            //ent.Aktif = kullanici.Aktif;
            ent.KurumId = kullanici.KurumId;
            ent.BirlikId = kullanici.BirlikId;
            ent.GirisAd = kullanici.GirisAd;
            ent.Rol = kullanici.Rol;
            ent.Sifre = kullanici.Sifre;
            ent.Soyad = kullanici.Soyad;
            ent.OlusturmaTarihi = DateTime.Now;
            Context.SaveChanges();
        }
        public void KullaniciYetkiEkle(KullaniciKurumYetkiDto kurumyetki)
        {

            var ent = Context.KullaniciKurumYetkiler.FirstOrDefault(x => x.Id == kurumyetki.Id);
            if (ent == null)
            {
                ent = new KullaniciKurumYetki();

                Context.KullaniciKurumYetkiler.Add(ent);
            }

            ent.KurumId = kurumyetki.KurumId;
            ent.KullaniciId = kurumyetki.KullaniciId;
            Context.SaveChanges();
        }
        public void KullaniciSil(int? kullaniciId)
        {

            var kulanici = Context.Kullanicilar.FirstOrDefault(p => p.Id == kullaniciId);

            var yetkiler = (from b in Context.KullaniciKurumYetkiler
                            where b.KullaniciId == kullaniciId
                            select b).ToList();

            foreach (var yetki in yetkiler)
            {
                Context.KullaniciKurumYetkiler.Remove(yetki);
            }

            kulanici.Aktif = false;

            Context.SaveChanges();
        }
        public void KullaniciGuncelle(Kullanici qry)
        {
            var ent = Context.Kullanicilar.FirstOrDefault(x => x.Id == qry.Id);
            if (ent == null)
            {
                ent = new Kullanici();

                Context.Kullanicilar.Add(ent);
            }

            ent.Ad = qry.Ad;

            ent.BirlikId = qry.BirlikId;
            ent.GirisAd = qry.GirisAd;
            ent.OlusturmaTarihi = qry.OlusturmaTarihi;
            ent.Rol = qry.Rol;
            ent.Sifre = qry.Sifre;
            ent.Soyad = qry.Soyad;


            Context.SaveChanges();
        }
        public void KullaniciYetkiGuncelle(KullaniciKurumYetkiDto dto)
        {
            var ent = Context.KullaniciKurumYetkiler.FirstOrDefault(x => x.KullaniciId == dto.Id);

            if (ent == null)
            {
                ent = new KullaniciKurumYetki();

                ent.KullaniciId = dto.KullaniciId;
                // ent.Id = Context.KullaniciKurumYetkiler.Max(x => x.Id) + 1;

                Context.KullaniciKurumYetkiler.Add(ent);
            }
            ent.KurumId = dto.KurumId;
            ent.Aktif = dto.Aktif;


            Context.SaveChanges();
        }
        public void BildirimCevapla(BildirimDto bildirim)
        {
            var ent = Context.Bildirimler.FirstOrDefault(x => x.Id == bildirim.Id);


            ent.CevapMesaji = bildirim.CevapMesaji;
            ent.CevapTarihi = DateTime.Now;
            ent.CevapYolu = bildirim.CevapYolu;
            ent.CevapVerenId = bildirim.CevapVerenId;
            ent.Durum = bildirim.Durum;

            Context.SaveChanges();
        }
        public Kullanici KullaniciGirisKontrol(string kullaniciadi, string sifre)
        {
            var sorgu = from c in Context.Kullanicilar
                        where c.GirisAd == kullaniciadi && c.Sifre == sifre && c.Aktif
                        select c;
            var r = sorgu.FirstOrDefault();
            return r;

        }
        public void SifreDegistir(Kullanici qry)
        {
            var ent = Context.Kullanicilar.FirstOrDefault(x => x.Id == qry.Id);

            ent.Ad = qry.Ad;
            ent.Aktif = qry.Aktif;
            ent.BirlikId = qry.BirlikId;
            ent.GirisAd = qry.GirisAd;
            ent.OlusturmaTarihi = qry.OlusturmaTarihi;
            ent.Rol = qry.Rol;
            ent.Soyad = qry.Soyad;
            ent.Sifre = qry.Sifre;
            Context.SaveChanges();


        }
        //public List<BildirimDto> kullanicibildirimistatistik(int kurumid, DateTime baslangic, DateTime bitis, int konu, int durum)
        //{

        //    baslangic = baslangic.StartOfDay();
        //    bitis = bitis.EndOfDay();

        //    var sorgu = from s in Context.Bildirimler
        //                join d in Context.Kullanicilar on s.KullaniciId equals d.Id into j4
        //                from d in j4.DefaultIfEmpty()
        //                join k in Context.Gruplar on s.GrupId equals k.Id into j2
        //                from k in j2.DefaultIfEmpty()
        //                join c in Context.Birimler on s.BirimId equals c.Id into j3
        //                from c in j3.DefaultIfEmpty()

        //                join h in Context.Kurumlar on s.KurumId equals h.Id into j5
        //                from h in j5.DefaultIfEmpty()
        //                where (s.KurumId == kurumid && s.OlusturmaTarihi >= baslangic && s.OlusturmaTarihi <= bitis && s.Tur == konu && s.Durum == durum)
        //                select new Dto.BildirimDto()
        //                {
        //                    BasvuruYolu = s.BasvuruYolu,
        //                    BirimId = s.BirimId,
        //                    CevapMesaji = s.CevapMesaji,
        //                    CevapTarihi = s.CevapTarihi,
        //                    CevapVerenId = s.CevapVerenId,
        //                    CevapYolu = s.CevapYolu,
        //                    Durum = s.Durum,
        //                    EPosta = s.EPosta,
        //                    GrupId = s.GrupId,
        //                    Gsm = s.Gsm,
        //                    Ip = s.Ip,
        //                    Konu = s.Konu,
        //                    TcId = s.TcId,
        //                    KullaniciAdi = s.KullaniciAdi,
        //                    Mesaj = s.Mesaj,
        //                    KullaniciId = s.KullaniciId,
        //                    KurumId = s.KurumId,
        //                    OlusturmaTarihi = s.OlusturmaTarihi,
        //                    Tarih = s.Tarih,
        //                    Tur = s.Tur,
        //                    UserAgent = s.UserAgent,
        //                    Id = s.Id,
        //                    GrupAd = k.Adi,
        //                    BirimAdi = c.Adi,
        //                    CevapVerenAdi = d.Ad + " " + d.Soyad,
        //                    KurumAdi = h.Adi

        //                };
        //    var sonuc = sorgu.ToList();
        //    return sonuc;

        //}
        public KurumDto GetKurumByDns(string dnsName)
        {
            var sorgu = from c in Context.Kurumlar
                        where c.DnsName == dnsName
                        select new KurumDto()
                        {
                            Id = c.Id,
                            OlusturmaTarihi = c.OlusturmaTarihi,
                            Adi = c.Adi,
                            BirlikId = c.BirlikId,
                            Aktif = c.Aktif,
                            SMTPUser = c.SMTPUser,
                            SMTPPass = c.SMTPPass,
                            SMTPServer = c.SMTPServer,
                            SkrsKodu = c.SkrsKodu,
                            DnsName = c.DnsName,
                            EMail = c.EMail

                        };
            var kurumbilgi = sorgu.FirstOrDefault();

            return kurumbilgi;


        }
        public KurumDto GetKurumByKurumId(int kurumId)
        {
            var sorgu = from c in Context.Kurumlar
                        where c.Id == kurumId
                        select new KurumDto()
                        {
                            Id = c.Id,
                            OlusturmaTarihi = c.OlusturmaTarihi,
                            Adi = c.Adi,
                            BirlikId = c.BirlikId,
                            Aktif = c.Aktif,
                            SMTPUser = c.SMTPUser,
                            SMTPPass = c.SMTPPass,
                            SMTPServer = c.SMTPServer,
                            SkrsKodu = c.SkrsKodu,
                            DnsName = c.DnsName,
                            EMail = c.EMail

                        };
            var kurumbilgi = sorgu.FirstOrDefault();

            return kurumbilgi;


        }
        public void KullaniciKurumYetkiGuncelle(KullaniciKurumYetkiDto kky)
        {
            var ent = Context.KullaniciKurumYetkiler.FirstOrDefault(x => x.Id == kky.Id);


            ent.KurumId = kky.KurumId;
            ent.Aktif = kky.Aktif;
            ent.KullaniciId = kky.KullaniciId;
            Context.SaveChanges();

        }
        public List<BirlikDto> BirlikListele()
        {
            var sorgu = from i in Context.Birlikler
                        where i.Aktif
                        select new BirlikDto
                        {
                            Id = i.Id,
                            Aktif = i.Aktif,
                            Adi = i.Adi,
                            Ilkodu = i.Ilkodu,
                            OlusturmaTarihi = i.OlusturmaTarihi
                        };
            var sonuc = sorgu.ToList();

            return sonuc;
        }
        public void BirlikEkle(BirlikDto birlikekle)
        {
            var ent = Context.Birlikler.FirstOrDefault(x => x.Id == birlikekle.Id);
            if (ent == null)
            {
                ent = new Birlik();
                Context.Birlikler.Add(ent);
            }
            //ent.Aktif = birlikekle.Aktif;
            ent.Ilkodu = birlikekle.Ilkodu;
            ent.Adi = birlikekle.Adi;

            Context.SaveChanges();
        }
        public void BirlikSil(int birlikId)
        {
            var ent = Context.Birlikler.FirstOrDefault(x => x.Id == birlikId);

            ent.Aktif = false;

            Context.SaveChanges();
        }
        public void BirlikGuncelle(Dto.BirlikDto birlik)
        {
            var ent = Context.Birlikler.FirstOrDefault(x => x.Id == birlik.Id);

            ent.Adi = birlik.Adi;
            ent.Aktif = birlik.Aktif;
            ent.Ilkodu = birlik.Ilkodu;


            Context.SaveChanges();
        }
        public void KullaniciKurumYetkiEkle(KullaniciKurumYetkiDto kurumyetki)
        {
            var ent = Context.KullaniciKurumYetkiler.FirstOrDefault(x => x.Id == kurumyetki.Id);
            if (ent == null)
            {
                ent = new KullaniciKurumYetki();
                Context.KullaniciKurumYetkiler.Add(ent);
            }
            ent.Aktif = kurumyetki.Aktif;
            ent.KullaniciId = kurumyetki.KullaniciId;
            ent.KurumId = kurumyetki.KurumId;
            Context.SaveChanges();

        }
        public void KullaniciKurumYetkiSil(int kullaniciId)
        {
            var kullanici = Context.KullaniciKurumYetkiler.FirstOrDefault(p => p.Id == kullaniciId);
            Context.KullaniciKurumYetkiler.Remove(kullanici);
            Context.SaveChanges();
        }
        public void BildirimSil(int BildirimId) 
        {
            var sorgu = Context.Bildirimler.FirstOrDefault(x => x.Id == BildirimId);
            sorgu.Aktif = false;
            Context.SaveChanges();

        }

    }
}
