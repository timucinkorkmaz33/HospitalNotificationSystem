<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HastaneOneriWeb.Default" %>

<%@ Import Namespace="ListItem=Ext.Net.ListItem" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Bildirim Menu</title>
    <script src="Resource/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />

</head>
<body>
    <form runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />

       
                <ext:Panel runat="server" Title='Bildirim İşlemleri' Region="North">
                    <TopBar>
                        <ext:Toolbar runat="server">
                            <Items>
                                <ext:ButtonGroup runat="server" Title="Bildirim" Columns="8">
                                    <Items>
                                        <ext:Button
                                            runat="server"
                                            Text="Bildirim Ekle"
                                            Scale="Large"
                                            IconAlign="Top"
                                            RowSpan="5"
                                            IconCls="bildirmekle">
                                            <Listeners>
                                                <Click Handler="loadPencere('Bildirim.aspx','Bildirim',1000,643)" />
                                            </Listeners>
                                        </ext:Button>

                                        <ext:Button
                                            runat="server"
                                            Text="Bildirim Sorgula"
                                            Scale="Large"
                                            IconAlign="Top"
                                            IconCls="bildirimsorgula"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('BildirimListele.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>

                                        <ext:Button
                                            runat="server"
                                            Text="Kurum Ekle"
                                            Scale="Large"
                                            IconAlign="Top"
                                            IconCls="istatistik"
                                            ID="btnKurumEkle"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('KurumKaydet.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>
                                        <ext:Button
                                            runat="server"
                                            Text="Grafik"
                                            Scale="Large"
                                            IconCls="graph"
                                            IconAlign="Top"
                                            ID="Istatistik"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('Istatistik.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>
                                        
                                          <ext:Button
                                            runat="server"
                                            Text="İstatistik"
                                            Scale="Large"
                                            IconCls="kurum"
                                            IconAlign="Top"
                                            ID="Button1"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('BildirimSorgula.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>
                                        <ext:Button
                                            runat="server"
                                            Text="Tablosal İstatistik"
                                            Scale="Large"
                                            IconCls="bildirimhesapla"
                                            IconAlign="Top"
                                            ID="Buttonistatistik"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('BildirimTurIstatistik.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>


                                        <ext:Button
                                            runat="server"
                                            Text="Birlik Ekle"
                                            Scale="Large"
                                            IconCls="birlik"
                                            IconAlign="Top"
                                            ID="Birlik"
                                            RowSpan="5">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('BirlikEkle.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button>

                                    </Items>
                                </ext:ButtonGroup>
                                <ext:ButtonGroup runat="server" Title="Kullanıcı" Columns="5">
                                    <Items>
                                        <ext:Button
                                            ID="btnkullaniciekle"
                                            runat="server"
                                            Text="Kullanıcı Ekle"
                                            IconCls="user"
                                            Scale="Large"
                                            IconAlign="Top"
                                            RowSpan="5"
                                            Cls="x-btn-as-arrow">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('KullaniciListele.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button> 
                                        <ext:Button
                                            ID="SilinenKullanici"
                                            runat="server"
                                            Text="Silinen Kullanicilar"
                                            IconCls="silinen"
                                            Scale="Large"
                                            IconAlign="Top"
                                            RowSpan="5"
                                            Cls="x-btn-as-arrow">
                                            <Listeners>
                                                <Click Handler="App.panelbildirim.loader.load('SilinenKullanicilar.aspx');"></Click>
                                            </Listeners>
                                        </ext:Button> 
                                       
                                        <ext:Button
                                            runat="server"
                                            Text="Şifre Değiştir"
                                            IconCls="key"
                                            Scale="Large"
                                            IconAlign="Top"
                                            RowSpan="5"
                                            Cls="x-btn-as-arrow">
                                            <Listeners>
                                                <Click Handler="loadPencere('SifreDegistir.aspx','Sifre Değiştir',342,145)" />
                                            </Listeners>
                                        </ext:Button>
                                        <ext:Button
                                            runat="server"
                                            Text="Oturumu Kapat"
                                            IconCls="close"
                                            Scale="Large"
                                            IconAlign="Top"
                                            RowSpan="5"
                                            Cls="x-btn-as-arrow">
                                            <Listeners>
                                                <Click Handler="kapat.oturumuKapat()"></Click>
                                            </Listeners>
                                        </ext:Button>
                                    </Items>
                                </ext:ButtonGroup>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Items>
                        <ext:Panel ID="panelbildirim" runat="server" Region="Center" Height="507" Border="false">
                            <Loader Mode="Frame" runat="server">
                                <LoadMask Msg="Yükleniyor..." ShowMask="True"></LoadMask>
                            </Loader>
                        </ext:Panel>

                    </Items>
                    
                    <BottomBar>
                        <ext:Toolbar runat="server">
                            <Items>
                                <ext:TextField runat="server" ID="kimlik" ReadOnly="True" MarginSpec="0 0 0 1180"></ext:TextField>
                            </Items>
                        </ext:Toolbar>
                    </BottomBar>
                </ext:Panel>
    </form>
</body>
</html>
