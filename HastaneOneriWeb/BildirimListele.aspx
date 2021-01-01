<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BildirimListele.aspx.cs" Inherits="HastaneOneriWeb.BildirimListele" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Gönderi Kaydı</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>

    <style>
        .red-row .x-grid-cell, .dirty-row .x-grid-rowwrap-div {
            background-color: pink !important;
        }

        .blue-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: skyblue !important;
        }

        .green-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: aquamarine !important;
        }

        .purple-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: chartreuse !important;
        }
    </style>


    <script type="text/javascript">
        function getRowClass(record) {
            if (record.data.Durum == 0) {
                return "red-row";
            }
            else if (record.data.Durum == 1) {
                return "blue-row";
            }
            else if (record.data.Durum == 2) {
                return "green-row";
            }
            else if (record.data.Durum == 3) {
                return "purple-row";
            }
        }
    </script>

</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Closable="false" Layout="Border" ID="w1">
            <Items>
                <ext:FieldContainer
                    runat="server"
                    Layout="HBoxLayout"
                    Region="North"
                    MarginSpec="20 20 20 20">
                    <Items>

                        <ext:DateField runat="server" ID="Baslangic" Width="230" FieldLabel="Başlangıç Tarihi:" MarginSpec=" 3 3 3 3" />
                        <ext:DateField runat="server" ID="Bitis" Width="230" FieldLabel="Bitiş Tarihi:" MarginSpec=" 3 3 3 3"></ext:DateField>
                        <ext:ComboBox
                            ID="secim"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Türü:"
                            Width="230"
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
                            Width="230"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3"
                            ValueField="Id"
                            DisplayField="Adi"
                            MatchFieldWidth="False">

                            <Store>
                                <ext:Store
                                    ID="kurumstore"
                                    runat="server"
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
                            ID="cmbCevapDurum"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            FieldLabel="Cevap Durumu:"
                            Width="230"
                            EmptyText="Seçiniz"
                            MarginSpec=" 3 3 3 3">

                            <Items>
                                <ext:ListItem Text="Cevaplanmadı" Value="0" />
                                <ext:ListItem Text="Cevaplandı" Value="1" />

                            </Items>
                        </ext:ComboBox>
                        <ext:Button runat="server" ID="sorgula" Icon="Magnifier" Width="80" Text="Listele" MarginSpec="0 5 5 5  ">
                            <Listeners>
                                <Click Handler="istatistik.istatistiklistele()"></Click>
                            </Listeners>
                        </ext:Button>

                        <%--  <ext:Button runat="server" ID="dokuman" Icon="Note" Text="İstatistiki Veriler" MarginSpec="5 5 5 5">
                            <Listeners>
                                <Click Handler="loadPencere('IstatistikVerileri.aspx','İstatistik Verileri',600,343)"></Click>
                            </Listeners>
                        </ext:Button>--%>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer runat="server">
                    <Items>
                    </Items>

                </ext:FieldContainer>

                <ext:GridPanel
                    runat="server"
                    ID="listelegridpanel"
                    ContextMenuID="contextMenu"
                    Region="Center">
                    <BottomBar>
                        <ext:PagingToolbar runat="server">
                        </ext:PagingToolbar>
                    </BottomBar>
                    <Store>
                        <ext:Store
                            ID="listelestore"
                            runat="server"
                            PageSize="23">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Id" />
                                        <ext:ModelField Name="Sonuc" />
                                        <ext:ModelField Name="OlusturmaTarihi" />
                                        <ext:ModelField Name="KurumId" />
                                        <ext:ModelField Name="BirlikAdi" />
                                        <ext:ModelField Name="KullaniciId" />
                                        <ext:ModelField Name="Ad" />
                                        <ext:ModelField Name="Konu" />
                                        <ext:ModelField Name="Mesaj" />
                                        <ext:ModelField Name="BasvuruYolu" />
                                        <ext:ModelField Name="Tur" />
                                        <ext:ModelField Name="Tarih" />
                                        <ext:ModelField Name="EPosta" />
                                        <ext:ModelField Name="Gsm" />
                                        <ext:ModelField Name="TcId" />
                                        <ext:ModelField Name="Ip" />
                                        <ext:ModelField Name="UserAgent" />
                                        <ext:ModelField Name="GrupId" />
                                        <ext:ModelField Name="BirimId" />
                                        <ext:ModelField Name="CevapTarihi" />
                                        <ext:ModelField Name="Durum" />
                                        <ext:ModelField Name="CevapMesaji" />
                                        <ext:ModelField Name="CevapVerenId" />
                                        <ext:ModelField Name="CevapYolu" />
                                        <ext:ModelField Name="TurAciklama" />
                                        <ext:ModelField Name="BasvuruAciklama" />
                                        <ext:ModelField Name="DurumAciklama" />
                                        <ext:ModelField Name="CavepYoluAciklama" />
                                        <ext:ModelField Name="GrupAd" />
                                        <ext:ModelField Name="BirimAdi" />
                                        <ext:ModelField Name="CevapVerenAdi" />
                                        <ext:ModelField Name="KurumAdi" />
                                        <ext:ModelField Name="BeklemeGunSayisi" />
                                        <ext:ModelField Name="SistemEtken" />
                                        <ext:ModelField Name="PersonelEtken" />  
                                        <ext:ModelField Name="BasvuruNo" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <ColumnModel runat="server">
                        <Columns>

                            <ext:Column runat="server" Text="Kurum Adi" DataIndex="KurumAdi">
                            </ext:Column>
                            <ext:Column runat="server" Text="Birlik Adi" DataIndex="BirlikAdi">
                            </ext:Column>

                            <ext:Column runat="server" Text="Bekleme Gun Sayısı" DataIndex="BeklemeGunSayisi" />

                            <ext:Column runat="server" Text="Bildirim Gonderen Adı" DataIndex="Ad">
                            </ext:Column>
                            <ext:Column runat="server" Text="Konu" DataIndex="Konu">
                            </ext:Column>
                            <ext:Column runat="server" Text="Mesaj" DataIndex="Mesaj">
                                <Editor>
                                    <ext:TextArea runat="server" ID="okuma" ReadOnly="True" Width="200" Height="150" StyleSpec="margin-top:135px;" />
                                </Editor>
                            </ext:Column>
                            <ext:Column runat="server" Text="Basvuru Yolu" DataIndex="BasvuruYolu">
                            </ext:Column>
                            <ext:Column runat="server" Text="Basvuru No" DataIndex="BasvuruNo">
                            </ext:Column>
                            <ext:Column runat="server" Text="Tur" DataIndex="Tur"/>
                            <ext:Column runat="server" Text="Personel Etken" DataIndex="PersonelEtken"/>
                            <ext:Column runat="server" Text="Sistem Etken" DataIndex="SistemEtken">
                            </ext:Column>
                            <ext:DateColumn Format="dd.MM.yyyy" runat="server" Text="Tarih" DataIndex="Tarih">
                            </ext:DateColumn>
                            <ext:Column runat="server" Text="E-Mail Adres" DataIndex="EPosta">
                            </ext:Column>
                            <ext:Column runat="server" Text="GSM" DataIndex="Gsm">
                            </ext:Column>
                            <ext:Column runat="server" Text="TC No" DataIndex="TcId">
                            </ext:Column> 
                            <ext:Column runat="server" Text="Ip" DataIndex="Ip">
                            </ext:Column>
                            <ext:Column runat="server" Text="Grup Ad" DataIndex="GrupAd">
                            </ext:Column>
                            <ext:Column runat="server" Text="Birim Adı" DataIndex="BirimAdi">
                            </ext:Column>
                            <ext:DateColumn Format="dd.MM.yyyy" runat="server" Text="Cevap Tarihi" DataIndex="CevapTarihi">
                            </ext:DateColumn>
                            <ext:Column runat="server" Text="Cevap Durumu" DataIndex="DurumAciklama">
                            </ext:Column>
                            <ext:Column runat="server" Text="Cevap Mesajı" DataIndex="CevapMesaji">
                                <Editor>
                                    <ext:TextArea runat="server" ID="cevap" ReadOnly="True" Width="200" Height="150" StyleSpec="margin-top:135px;" />
                                </Editor>
                            </ext:Column>
                            <ext:Column runat="server" Text="Cevap Veren Adı" DataIndex="CevapVerenAdi">
                            </ext:Column>
                            <ext:Column runat="server" Text="Cevap Yolu" DataIndex="CevapYolu">
                            </ext:Column> 
                            <ext:Column runat="server" Text="Sonuç" DataIndex="Sonuc">
                            </ext:Column>
                            
                        </Columns>
                    </ColumnModel>
                    <Plugins>
                        <ext:CellEditing runat="server" ClicksToEdit="1" />
                    </Plugins>
                    <View>
                        <ext:GridView ID="GridView1" runat="server">
                            <GetRowClass Fn="getRowClass" />
                        </ext:GridView>
                    </View>
                    <%--<TopBar>
                        <ext:Toolbar runat="server">
                            <Items>
                                <ext:TextField
                                    ID="TextField1"
                                    runat="server"
                                    Flex="1"
                                    EmptyText="Aramak İstediğiniz Kişi yada Numarayı Giriniz ">
                                    <Listeners>
                                        <Change Buffer="500" Handler="Filtrele(App.mystore,this.getValue())"></Change>
                                    </Listeners>
                                </ext:TextField>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>--%>
                </ext:GridPanel>
                <ext:Menu ID="contextMenu" runat="server">
                    <Items>
                        <ext:MenuItem runat="server" ID="menuAdd" Icon="NoteAdd" Text="Cevapla">
                            <Listeners>
                                <Click Handler="loadPencere('BildirimCevapla.aspx?param='+App.listelegridpanel.getSelectionModel().getSelection()[0].data.Id+'','Bildirim Cevapla',550,345)" />
                            </Listeners>
                        </ext:MenuItem>
                         <ext:MenuItem runat="server" ID="MenuItem1" Icon="Printer" Text="Rapor">
                            <Listeners>
                                <Click Handler="loadPencere('RaporOlustur.aspx?param='+App.listelegridpanel.getSelectionModel().getSelection()[0].data.Id+'','Rapor Olustur',1000,501)" />
                            </Listeners>
                        </ext:MenuItem>
                        <ext:MenuItem runat="server" ID="MenuItem2" Icon="Delete" Text="Sil">
                            <Listeners>
                                <Click Handler="  Ext.Msg.confirm('Uyarı', 'Bildirimi Silmek İstiyor Musunuz?', function(btn){if (btn=='yes'){BildirimSil.BildirimSil(App.listelegridpanel.getSelectionModel().getSelection()[0].data.Id);alert('Bildirim Silme İşlemi Başarıyla Gerçekleşti!');}
                                                else{}});
                                                   "  />
                            </Listeners>
                        </ext:MenuItem>
                    </Items>
                </ext:Menu>
            </Items>

        </ext:Viewport>
    </form>
</body>
</html>

