<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SilinenKullanicilar.aspx.cs" Inherits="HastaneOneriWeb.SilinenKullanicilar" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />

    <script>

        var myRenderer = function (value, metadata, record) {
            return record.data.BirlikAdi;
        }

        function Setdate() {


            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd
            }

            if (mm < 10) {
                mm = '0' + mm
            }

            today = mm + '.' + dd + '.' + yyyy;
            App.datetime.setValue(today);
        }
    </script>

</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Layout="BorderLayout">
            <Items>
                <ext:Panel runat="server" Layout="Fit" Region="Center" Flex="1" AutoScroll="True">

                    
                    <Items>
                        <ext:GridPanel
                            runat="server"
                            ID="KullaniciGrd"
                            ContextMenuID="contextmenu"
                            AutoScroll="true">
                            <Store>
                                <ext:Store
                                    ID="kullanicistore"
                                    runat="server"
                                    PageSize="10"   >
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="Id" />
                                                <ext:ModelField Name="GirisAd" />
                                                <ext:ModelField Name="Sifre" />
                                                <ext:ModelField Name="Ad" />
                                                <ext:ModelField Name="Soyad" />
                                                <ext:ModelField Name="Aktif" Type="Boolean" />
                                                <ext:ModelField Name="BirlikId" />
                                                <ext:ModelField Name="Rol" />
                                                <ext:ModelField Name="KurumId" />
                                                <ext:ModelField Name="BirlikAdi" />
                                                <ext:ModelField Name="OlusturmaTarihi" DateFormat="dd.MM.yyyy" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Giriş Adı" DataIndex="GirisAd" Flex="1">
                                      

                                    </ext:Column>
                                    <ext:Column runat="server" Text="Sifre" ID="sifre" DataIndex="Sifre" Flex="1">
                                       

                                    </ext:Column>
                                    <ext:Column runat="server" Text="Ad" DataIndex="Ad" Flex="1">
                                       

                                    </ext:Column>
                                    <ext:Column runat="server" Text="Soyad" DataIndex="Soyad" Flex="1">
                                      

                                    </ext:Column>
                                    <ext:Column runat="server" Text="Birlik No" DataIndex="BirlikId"  Flex="1">
                                       <%-- <Editor>
                                            <ext:ComboBox
                                                ID="BirlikId"
                                                runat="server"
                                                Editable="false"
                                                AllowBlank="False"
                                                QueryMode="Local"
                                                TriggerAction="All"
                                                Width="248"
                                                ValueField="Id"
                                                DisplayField="Adi"
                                                EmptyText="Seçiniz"
                                                ForceSelection="True">
                                                <Store>
                                                    <ext:Store
                                                        ID="birimstore"
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
                                        </Editor>--%>
                                        <Renderer Fn="myRenderer"></Renderer>
                                       
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Rol" DataIndex="Rol" Flex="1">
                                    
                                    </ext:Column>

                                    <ext:CommandColumn runat="server" Width="110" Text="Kullanıcı Aktifleştir">
                                        <Commands>
                                            <ext:GridCommand Icon="Accept" CommandName="Aktifleştir" Text="Aktifleştir" />
                                        </Commands>
                                        <Listeners>
                                            <Command Handler="
                                                Ext.Msg.confirm('Uyarı', 'Kullanıcıyı Aktifleştirmek İstiyor Musunuz?', function(btn){if (btn=='yes'){Aktif.Aktif(record.data.Id);alert('Kullanıcı Aktifleştirme İşlemi Başarıyla Gerçekleşti!');}
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
                        <ext:Menu ID="contextmenu" runat="server">
                            <Items>
                                <ext:MenuItem runat="server" ID="menuAdd" Icon="NoteAdd" Text="Yetki Ekle">
                                    <Listeners>
                                        <Click Handler="loadPencere('KurumAtaYeniYetki.aspx?param='+App.KullaniciGrd.getSelectionModel().getSelection()[0].data.Id,'Yetki Ekle',550,145)" />
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
