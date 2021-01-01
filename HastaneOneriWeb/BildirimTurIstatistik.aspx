<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BildirimTurIstatistik.aspx.cs" Inherits="HastaneOneriWeb.BildirimTurIstatistik" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Gönderi Kaydı</title>

    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>

    <script>
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
        };

        var exportData = function (format) {
            App.FormatType.setValue(format);
            var store = App.listelegridpanel.store;

            store.submitData(null, { isUpload: true });
        };

    </script>
    <style type="text/css">
        .user {
            font-size: 25px;
            color: #000000;
            font-style: oblique;
        }
    </style>
</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Closable="false" Layout="Border" ID="w1">
            <Items>
                <ext:FieldContainer
                    ID="SorguField"
                    runat="server"
                    Layout="VBoxLayout"
                    Region="West"
                    MarginSpec="20 20 20 20">
                    <Items>

                        <ext:ComboBox
                            ID="cmbYil"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Yıl:"
                            Width="310"
                            MultiSelect="True"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3">

                            <Items>
                                <ext:ListItem Text="2010" Value="1" />
                                <ext:ListItem Text="2011" Value="2" />
                                <ext:ListItem Text="2012" Value="3" />
                                <ext:ListItem Text="2013" Value="4" />
                                <ext:ListItem Text="2014" Value="5" />
                                <ext:ListItem Text="2015" Value="6" />
                                <ext:ListItem Text="2016" Value="7" />
                                <ext:ListItem Text="2017" Value="8" />
                                <ext:ListItem Text="2018" Value="9" />
                                <ext:ListItem Text="2019" Value="10" />
                                <ext:ListItem Text="2020" Value="11" />
                                <ext:ListItem Text="2021" Value="12" />
                                <ext:ListItem Text="2022" Value="13" />
                                <ext:ListItem Text="2023" Value="14" />
                                <ext:ListItem Text="2024" Value="15" />
                                <ext:ListItem Text="2025" Value="16" />
                                <ext:ListItem Text="2026" Value="17" />
                            </Items>
                        </ext:ComboBox>


                        <ext:ComboBox
                            ID="cmbAy"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Ay:"
                            Width="310"
                            MultiSelect="True"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3">

                            <Items>
                                <ext:ListItem Text="Ocak" Value="1" />
                                <ext:ListItem Text="Şubat" Value="2" />
                                <ext:ListItem Text="Mart" Value="3" />
                                <ext:ListItem Text="Nisan" Value="4" />
                                <ext:ListItem Text="Mayıs" Value="5" />
                                <ext:ListItem Text="Haziran" Value="6" />
                                <ext:ListItem Text="Temmuz" Value="7" />
                                <ext:ListItem Text="Ağustos" Value="8" />
                                <ext:ListItem Text="Eylül" Value="9" />
                                <ext:ListItem Text="Ekim" Value="10" />
                                <ext:ListItem Text="Kasım" Value="11" />
                                <ext:ListItem Text="Aralık" Value="12" />
                            </Items>
                        </ext:ComboBox>

                        <ext:ComboBox
                            ID="secim"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Türü:"
                            Width="310"
                            MultiSelect="True"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3">

                            <Items>
                                <ext:ListItem Text="Bilgi Edinme" Value="1" />
                                <ext:ListItem Text="Diğer" Value="2" />
                                <ext:ListItem Text="Görüş İsteme" Value="3" />
                                <ext:ListItem Text="Şikayet" Value="4" />
                                <ext:ListItem Text="Talep/Öneri" Value="5" />
                                <ext:ListItem Text="Teşekkür" Value="6" />
                            </Items>
                        </ext:ComboBox>

                        <ext:ComboBox
                            ID="kurum"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Kurum:"
                            Width="310"
                            MultiSelect="True"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3"
                            ValueField="Id"
                            DisplayField="Adi">

                            <Store>
                                <ext:Store
                                    ID="kurumstore"
                                    runat="server"
                                    Width="310"
                                    PageSize="10">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="Id" />
                                                <ext:ModelField Name="Adi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>

                        </ext:ComboBox>

                        <ext:ComboBox
                            ID="cmbPersonelEtken"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            MultiSelect="True"
                            TriggerAction="All"
                            FieldLabel="Personel Kaynaklı Etkenler:"
                            Width="310"
                            EmptyText="Seçiniz"
                            MarginSpec="3 3 3 3">
                            <Items>
                                <ext:ListItem Text="Diğer" Value="1" />
                                <ext:ListItem Text="Diğer Çalışan (sekreterlik/güvenlik/temizlik)" Value="2" />
                                <ext:ListItem Text="Güvenlik" Value="3" />
                                <ext:ListItem Text="Hekim" Value="4" />
                                <ext:ListItem Text="Hemşire" Value="5" />
                                <ext:ListItem Text="Sekreter" Value="6" />
                                <ext:ListItem Text="Temizlik Personeli" Value="7" />
                                <ext:ListItem Text="Tüm Personel" Value="8" />
                                <ext:ListItem Text="Üst Yönetim" Value="9" />
                                <ext:ListItem Text="Yardımcı sağlık Personeli" Value="10" />
                            </Items>
                        </ext:ComboBox>
                        <ext:ComboBox
                            ID="cmbSistemEtken"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            TriggerAction="All"
                            MultiSelect="True"
                            FieldLabel="Sistem Kaynaklı Etkenler:"
                            Width="310"
                            EmptyText="Seçiniz"
                            MarginSpec="3 3 3 3">
                            <Items>
                                <ext:ListItem Text="Başvuru ve Dava Edememe" Value="1" />
                                <ext:ListItem Text="Bilgilendirilmiş Rızanın alınmaması" Value="2" />
                                <ext:ListItem Text="Diğer" Value="3" />
                                <ext:ListItem Text="Dini Vecibelerini Yerine Getirememe" Value="4" />
                                <ext:ListItem Text="Ekipman Yetersizliği" Value="5" />
                                <ext:ListItem Text="Fiziki Altyapı" Value="6" />
                                <ext:ListItem Text="Güvenliğin Sağlanmaması" Value="7" />
                                <ext:ListItem Text="Hizmete Geç Ulaşım" Value="8" />
                                <ext:ListItem Text="Hizmetten Genel Olarak Yararlanamama" Value="9" />
                                <ext:ListItem Text="İletişim Bozukluğu" Value="10" />
                                <ext:ListItem Text="Mahremiyete uyulmaması<" Value="11" />
                                <ext:ListItem Text="Memnuniyet" Value="12" />
                                <ext:ListItem Text="MHRS/Hastane Randevu Sistemi" Value="13" />
                                <ext:ListItem Text="Mobbing" Value="14" />
                                <ext:ListItem Text="Otelcilik Hizmetleri" Value="15" />
                                <ext:ListItem Text="pers. çalışma koşulları /maaş  sorunu /özlük hk." Value="16" />
                                <ext:ListItem Text="Personel Yetersizliği" Value="17" />
                                <ext:ListItem Text="Sağ. Kur./ Persnl.Seçmeme/ Değiştiremme" Value="18" />
                                <ext:ListItem Text="Saygınlık Ve Rahatlık Görememe" Value="19" />
                                <ext:ListItem Text="Teknik Sorunlar" Value="20" />
                                <ext:ListItem Text="Tıbbi Malzeme Olmaması" Value="21" />
                                <ext:ListItem Text="Tıbbi Müdahele Sorunlar" Value="22" />
                                <ext:ListItem Text="Yeterli Bilgilendirilmeme" Value="23" />
                                <ext:ListItem Text="Ziyaretçi Kabul edememe/ Refakatçi bulundurumama" Value="24" />
                            </Items>
                        </ext:ComboBox>
                        <ext:FieldContainer
                            ID="FieldContainer1"
                            runat="server"
                            Layout="HBoxLayout"
                            Region="West"
                            MarginSpec="10 0 0 0">
                            <Items>
                                <ext:Button runat="server" ID="sorgula" Icon="Magnifier" Width="80" Text="Sorgula   " MarginSpec="0 5 5 5  ">
                                    <Listeners>
                                        <Click Handler="istatistik.istatistiklistele()"></Click>
                                    </Listeners>
                                </ext:Button>
                                <ext:Button runat="server" ID="temizle" Icon="Erase" Width="80" Text="Temizle" MarginSpec="0 5 5 5  ">
                                    <Listeners>
                                        <Click Handler="App.kurum.clear();App.secim.clear();App.cmbSistemEtken.clear();
                                    App.cmbPersonelEtken.clear();App.cmbAy.clear();App.cmbYil.clear();">
                                        </Click>
                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:FieldContainer>
                    </Items>
                </ext:FieldContainer>

                <ext:Panel
                    runat="server"
                    ID="MerkezPanel"
                    Region="Center"
                    AutoScroll="True">
                    <Items>
                        <ext:Label runat="server" MarginSpec="0 0 0 500" ID="lblBildirimSonuc"></ext:Label>
                        <ext:Label runat="server" MarginSpec="0 0 0 500" ID="lblBildirimSonuc1"></ext:Label>
                        <ext:GridPanel
                            runat="server"
                            ID="listelegridpanel"
                            Title="Personel Kaynaklı Etken"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="listelestore"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Etken Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                        <ext:GridPanel
                            runat="server"
                            ID="SistemEtkenGrd"
                            Title="Sistem Kaynaklı Etken"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="SistemEtkenListele"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Etken Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                     <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                        <ext:GridPanel
                            runat="server"
                            ID="BasvuruGrd"
                            Title="Basvuru Kanalı"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="BasvuruListele"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Basvuru Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                      <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                        <ext:GridPanel
                            runat="server"
                            ID="BirimGrd"
                            Title="Bildirim Birimler"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="BirimListele"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Birim Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                      <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                        <ext:GridPanel
                            runat="server"
                            ID="IcerikGrd"
                            Title="Bildirim İçerik"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="IcerikListele"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="İçerik Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                      <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                        <ext:GridPanel
                            runat="server"
                            ID="SonucGrd"
                            Title="Bildirim Sonuç"
                            Region="Center"
                            MarginSpec="0 0 10 200"
                            Width="500">

                            <Store>
                                <ext:Store
                                    ID="SonucListele"
                                    runat="server"
                                    PageSize="23">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="BildirimSayi" />
                                                <ext:ModelField Name="EtkenAdi" />
                                                <ext:ModelField Name="BildirimYuzdesi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Sonuç Adi" DataIndex="EtkenAdi" Flex="1">
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Bildirim Sayisi" DataIndex="BildirimSayi" Flex="1">
                                    </ext:Column>
                                      <ext:Column runat="server" Text="Bildirim Yuzdesi(%)" DataIndex="BildirimYuzdesi" Flex="1">
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>


                        </ext:GridPanel>
                    </Items>
                </ext:Panel>
            </Items>

        </ext:Viewport>
    </form>
</body>
</html>

