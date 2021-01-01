<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BirlikEkle.aspx.cs" Inherits="HastaneOneriWeb.BirlikEkle" %>


<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />

</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Layout="BorderLayout">
            <Items>
                <ext:Panel runat="server" Layout="Fit" Region="Center" Flex="1">
                    <TopBar>
                        <ext:Toolbar runat="server">
                        </ext:Toolbar>
                    </TopBar>
                    <Items>
                        <ext:FormPanel
                            runat="server"
                            ID="fpanel1"
                            AutoScroll="True"
                            Frame="true"
                            UI="Default">
                            <Items>

                                <ext:FieldContainer
                                    runat="server"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:ButtonGroup runat="server" Title="İşlemler" Height="85" Columns="3">
                                            <Items>
                                                <ext:Button
                                                    ID="btn1"
                                                    runat="server"
                                                    Text="Temizle"
                                                    IconCls="temizle"
                                                    IconAlign="Top"
                                                    Scale="Large">
                                                    <Listeners>
                                                        <Click Handler="App.GirisAdi.clear(),App.Sifre.clear(),
                                           App.Ad.clear(),App.Soyad.clear()
                                           App.BirlikNo.clear(),App.Rol.clear();" />
                                                    </Listeners>
                                                </ext:Button>

                                                <ext:Button
                                                    ID="Button1"
                                                    runat="server"
                                                    Text="Yeni Kayıt Ekle"
                                                    IconCls="save"
                                                    Scale="Large"
                                                    IconAlign="Top">
                                                    <Listeners>
                                                        <Click Handler="Ekle.ekle();" />
                                                    </Listeners>
                                                </ext:Button>

                                                <ext:Button
                                                    ID="Button2"
                                                    runat="server"
                                                    Text="Kayıt Güncelle"
                                                    IconCls="update"
                                                    Scale="Large"
                                                    IconAlign="Top">
                                                    <Listeners>
                                                        <Click Handler="App.Birlikstore.sync();">
                                                        </Click>

                                                    </Listeners>
                                                </ext:Button>

                                            </Items>
                                        </ext:ButtonGroup>

                                        <ext:ButtonGroup runat="server" BodyPadding="15" Title="Kayıt" Height="85" Columns="4">

                                            <Items>
                                                <ext:TextField runat="server" ID="Adi" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Birlik Adı" />
                                                <ext:TextField runat="server" ID="Ilkodu" AllowBlank="False" Cls="textField" FieldLabel="İl kodu" MarginSpec="10 3 0 5" />
                                            </Items>
                                        </ext:ButtonGroup>
                                       
                                    </Items>
                                </ext:FieldContainer>

                                <ext:GridPanel
                                    runat="server"
                                    ID="KullaniciGrd"
                                    AutoScroll="true">
                                    <BottomBar>
                                        <ext:PagingToolbar runat="server">
                                        </ext:PagingToolbar>
                                    </BottomBar>
                                    <Store>
                                        <ext:Store
                                            ID="Birlikstore"
                                            runat="server"
                                            PageSize="15"
                                            OnBeforeStoreChanged="Birlikstore_OnBeforeStoreChanged">

                                            <Model>
                                                <ext:Model runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="Id" />
                                                        <ext:ModelField Name="Aktif" />
                                                        <ext:ModelField Name="Adi" />
                                                        <ext:ModelField Name="Ilkodu" />
                                                        <ext:ModelField Name="OlusturmaTarihi" DateFormat="dd.MM.yyyy" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel runat="server">
                                        <Columns>

                                            <ext:Column runat="server" Text="Birlik Adı" DataIndex="Adi" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="BirlikAdiGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="İl Kodu" DataIndex="Ilkodu" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="IlkoduGuncelle" />
                                                </Editor>
                                            </ext:Column>

                                            <ext:DateColumn runat="server" Format="dd.MM.yyyy" Text="OlusturmaTarihi" DataIndex="OlusturmaTarihi" Flex="1">
                                            </ext:DateColumn>
                                            <ext:CommandColumn runat="server" Width="110" Text="İşlem">
                                                <Commands>
                                                    <ext:GridCommand Icon="Delete" CommandName="Delete" Text="Sil" />
                                                </Commands>
                                                <Listeners>
                                                    <Command Handler="
                                                         Ext.Msg.confirm('Uyarı', 'Birliği Silmek İstiyor Musunuz?', function(btn){if (btn=='yes'){BirlikSil.sil(record.data.Id);alert('Birlik Silme İşlemi Başarıyla Gerçekleşti!');}
                                                else{}});
                                                        " />

                                                </Listeners>
                                            </ext:CommandColumn>

                                        </Columns>
                                    </ColumnModel>

                                    <View>
                                        <ext:GridView runat="server" StripeRows="true" />
                                    </View>

                                    <Plugins>
                                        <ext:CellEditing runat="server" ClicksToEdit="1" />
                                    </Plugins>

                                </ext:GridPanel>
                            </Items>
                        </ext:FormPanel>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>
