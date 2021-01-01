using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HastaneOneriEntity.Enums
{
    public enum KullanciRol
    {
        SysAdmin, Kullanici, BirlikYönetici
    }

    public enum BildirimTuru
    {
        BilgiEdinme = 1,
        Diğer = 2,
        Görüşisteme = 3,
        Şikayet = 4,
        TalepÖneri = 5,
        Teşekkür = 6

    }

    public enum CevapYolu
    {
        EMail = 1,
        Faks = 2,
        ResmiYazı = 3

    }

    public enum BasvuruYolu
    {
        WebSite = 1,
        BilgiEdinme = 2,
        Bimer = 3,
        Diğer = 4,
        DilekÖneriKutuları = 5,
        Dilekçe = 6,
        EMail = 7,
        HastaHakları = 8,
        IlSağlıkMüd = 9,
        Sabim = 10

    }

    public enum PersonelEtken
    {
        Diğer = 1,
        DiğerÇalışan = 2,
        Güvenlik = 3,
        Hekim = 4,
        Hemşire = 5,
        Sekreter = 6,
        TemizlikPersoneli = 7,
        TümPersonel = 8,
        ÜstYönetim = 9,
        YardımcıSağlıkPersoneli = 10,
        Hekimintedaviyönteminemüdahale = 11,
        DanışmaPersoneli=12 
        

    }

    public enum SistemEtken
    {
        BaşvuruveDavaEdememe = 1,
        BilgilendirilmişRızanınalınmaması = 2,
        Diğer = 3,
        DiniVecibeleriniYerineGetirememe = 4,
        EkipmanYetersizliği = 5,
        FizikiAltyapı = 6,
        GüvenliğinSağlanmaması = 7,
        HizmeteGeçUlaşım = 8,
        HizmettenGenelOlarakYararlanamama = 9,
        IletişimBozukluğu = 10,
        Mahremiyeteuyulmaması = 11,
        Memnuniyet = 12,
        MhrsHastaneRandevuSistemi = 13,
        Mobbing = 14,
        OtelcilikHizmetleri = 15,
        Persçalışmakoşullarımaaşsorunuözlükhk = 16,
        PersonelYetersizliği = 17,
        SağKurPersnlSeçmemeDeğiştirememe = 18,
        SaygınlıkVeRahatlıkGörememe = 19,
        TeknikSorunlar = 20,
        TıbbiMalzemeOlmaması = 21,
        TıbbiMüdaheleSorunlar = 22,
        YeterliBilgilendirilmeme = 23,
        ZiyaretçiKabuledememeRefakatçibulundurumama = 24,
        Hekimintedaviyönteminemüdahale=25, 
        Hastanınniteliklihizmetalamadığıiddası = 26,
        Tedavitalebi = 27,
        Bilgibelgegüvenliğininsağlanamaması = 28,
        HastaneninIşleyişkurallarınauygunolmayantalepleri = 29,
        Tıbbimalzemebedelleri = 30,
        SgKileilgilisorunlar = 31,
        Muayeneprosedürüneuymama = 32
       
    }

    public enum Sonuc
    {
        AdliKonu = 1,
        BaşvuranHaklı = 2,
        Değerlendirmede = 3,
        Diğer = 4,
        HastaHakihlalivar = 5,
        HastaHakIhlaliyok = 6,
        KapsamDışı = 7,
        KurumHaklı = 8
    }
}
