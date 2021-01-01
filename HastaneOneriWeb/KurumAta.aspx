<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KurumAta.aspx.cs" Inherits="HastaneOneriWeb.KurumAta" %>


<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Layout="BorderLayout">
            <Items>
                <ext:Panel runat="server" Layout="Fit" Region="Center" Flex="1">
                    <Items>
                        <ext:GridPanel
                            runat="server"
                            ID="KullaniciGrd"
                            ContextMenuID="contextMenu"
                            AutoScroll="true">
                            <Store>
                                <ext:Store
                                    ID="kullanicistore"
                                    runat="server"
                                    PageSize="10"
                                    AutoSync="True"
                                    OnBeforeStoreChanged="kullanicistore_OnBeforeStoreChanged">

                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="Id" />
                                                <ext:ModelField Name="KurumIdList" />
                                                <ext:ModelField Name="KurumId" />
                                                <ext:ModelField Name="KurumAdi" />
                                                <ext:ModelField Name="Aktif" />
                                                <ext:ModelField Name="KullaniciId" />
                                                <ext:ModelField Name="KullaniciAdi" />
                                                <ext:ModelField Name="OlusturmaTarihi" DateFormat="dd.MM.yyyy" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Kullanici Adi" DataIndex="KullaniciAdi" Flex="1">
                                    </ext:Column>
                                   <%-- <ext:DateColumn Format="dd.MM.yyyy" runat="server" Text="OlusturmaTarihi" DataIndex="OlusturmaTarihi" Flex="1">
                                    </ext:DateColumn>--%>
                                  
                                    <ext:Column runat="server" Text="Kurum Adı" DataIndex="KurumAdi" Flex="1">
                                        
                                    </ext:Column>
                                    <ext:CommandColumn runat="server" Width="58" Text="Yetki Sil">
                                        <Commands>
                                            <ext:GridCommand Icon="Delete" CommandName="Delete" Text="Sil" />
                                        </Commands>
                                        <Listeners>
                                            <Command Handler="
                                                 Ext.Msg.confirm('Uyarı', 'Kurum Silmek İstiyor Musunuz?', function(btn){if (btn=='yes'){Sil.sil(record.data.Id);alert('Kurum Yetki Silme İşlemi Başarıyla Gerçekleşti!');}
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
                         <ext:Menu ID="contextMenu" runat="server">
                    <Items>
                        <ext:MenuItem runat="server" ID="menuAdd" Icon="NoteAdd" Text="Yetki Ekle">
                            <Listeners>
                                <Click Handler="loadPencere('KurumAtaYeniYetki.aspx?param='+App.KullaniciGrd.getSelectionModel().getSelection()[0].data.KullaniciId,'Yetki Ekle',300,140)" />
                            </Listeners>
                        </ext:MenuItem>
                    </Items>
                </ext:Menu>
                    </Items>
            </ext:Panel>              
</Items>
        </ext:Viewport>
    </form>
</body>
</html>
