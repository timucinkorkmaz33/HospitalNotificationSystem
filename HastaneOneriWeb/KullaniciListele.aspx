<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciListele.aspx.cs" Inherits="HastaneOneriWeb.KullaniciEkle" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />

    <script>
        
        var  myRenderer=function(value, metadata, record) {
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

                    <TopBar>
                        <ext:Toolbar runat="server">
                            <Items>
                                <ext:Button
                                    ID="Button3"
                                    runat="server"
                                    Text="Yeni Kullanıcı"
                                    IconCls="add1"
                                    Scale="Large"
                                    MarginSpec="0 5 5 5">
                                    <Listeners>
                                        <%-- <Click Handler="App.kullanicistore.add({Id:0});" />--%>
                                        <Click Handler="loadPencere('YeniKullanici.aspx','Kullanici Ekle',1100,193)" />
                                    </Listeners>
                                </ext:Button>

                                <ext:ToolbarSeparator runat="server" />
                                <ext:Button
                                    ID="Button5"
                                    runat="server"
                                    Text="Kayıt Güncelle"
                                    IconCls="update"
                                    Scale="Large"
                                    MarginSpec="0 5 5 5">
                                    <Listeners>
                                        <Click Handler="App.kullanicistore.sync();window.location.reload();">
                                        </Click>

                                    </Listeners>
                                </ext:Button>
                                <ext:ToolbarSeparator runat="server" />
                                <ext:Button
                                    ID="Button1"
                                    runat="server"
                                    Text="Yetki Listele"
                                    IconCls="yetkilistele"
                                    Scale="Large"
                                    MarginSpec="0 5 5 5">
                                    <Listeners>
                                        <Click Handler="loadPencere('KurumAta.aspx','Kullanici Yetkileri',400,500)">
                                        </Click>

                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <%--                                        <ext:ButtonGroup runat="server" Title="Kayıt" Height="90" Columns="4" Flex="1">

                                            <Items>
                                                <ext:TextField runat="server" ID="GirisAdi" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Giriş Adı" />
                                                <ext:TextField runat="server" ID="Sifre" AllowBlank="False" Cls="textField" FieldLabel="Şifre" MarginSpec="10 3 0 5" />
                                                <ext:TextField runat="server" ID="Ad" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Ad" />
                                                <ext:ComboBox
                                                    ID="KurumKodu"
                                                    runat="server"
                                                    Editable="false"
                                                    AllowBlank="False"
                                                    QueryMode="Local"
                                                    TriggerAction="All"
                                                    FieldLabel="KurumAdı:"
                                                    Width="248"
                                                    ValueField="Id"
                                                    DisplayField="Adi"
                                                    
                                                    EmptyText="Seçiniz"
                                                    MarginSpec="10 3 0 5"
                                                    ForceSelection="True">
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


                                                <ext:TextField runat="server" ID="Soyad" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Soyad" />
                                                <ext:ComboBox
                                                    ID="BirlikId"
                                                    runat="server"
                                                    Editable="false"
                                                    AllowBlank="False"
                                                    QueryMode="Local"
                                                    TriggerAction="All"
                                                    FieldLabel="Birlik Adı:"
                                                    Width="248"
                                                    ValueField="Id"
                                                    DisplayField="Adi"
                                                    EmptyText="Seçiniz"
                                                    MarginSpec="10 3 0 5"
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
                                                <ext:ComboBox
                                                    ID="Rol"
                                                    runat="server"
                                                    Editable="false"
                                                    AllowBlank="False"
                                                    QueryMode="Local"
                                                    TriggerAction="All"
                                                    FieldLabel="Rol:"
                                                    Width="248"
                                                    EmptyText="Seçiniz"
                                                    MarginSpec="10 3 0 5"
                                                    ForceSelection="True">
                                                    <Items>
                                                        <ext:ListItem Text="SysAdmin" Value="SysAdmin" />
                                                        <ext:ListItem Text="Kullanıcı" Value="Kullanici" />
                                                       
                                                    </Items>
                                                </ext:ComboBox>
                                                <ext:ComboBox
                                                    ID="Rol1"
                                                    runat="server"
                                                    Editable="false"
                                                    AllowBlank="False"
                                                    QueryMode="Local"
                                                    TriggerAction="All"
                                                    FieldLabel="Rol:"
                                                    Width="248"
                                                    EmptyText="Seçiniz"
                                                    MarginSpec="10 3 0 5"
                                                    ForceSelection="True">
                                                    <Items>
                                                        <ext:ListItem Text="SysAdmin" Value="SysAdmin" />
                                                        <ext:ListItem Text="Kullanıcı" Value="Kullanici" />

                                                    </Items>
                                                </ext:ComboBox>

                                            </Items>
                                        </ext:ButtonGroup>--%>
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
                                    PageSize="10"
                                    OnBeforeStoreChanged="kullanicistore_AfterRecordUpdated">
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
                                                <ext:ModelField Name="KurumAdi" />
                                                <ext:ModelField Name="OlusturmaTarihi" DateFormat="dd.MM.yyyy" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <ColumnModel runat="server">
                                <Columns>
                                    <ext:Column runat="server" Text="Giriş Adı" DataIndex="GirisAd" Flex="1">
                                        <Editor>
                                            <ext:TextField runat="server" ID="BirlikGuncelle" />
                                        </Editor>
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Sifre" ID="sifre" DataIndex="Sifre" Flex="1">
                                        <Editor>
                                            <ext:TextField runat="server" ID="KurumAdiGuncelle" />
                                        </Editor>
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Ad" DataIndex="Ad" Flex="1">
                                        <ext:Editor>
                                            <ext:TextField runat="server" ID="SkrsGuncelle" />
                                        </ext:Editor>
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Soyad" DataIndex="Soyad" Flex="1">
                                        <Editor>
                                            <ext:TextField runat="server" ID="SmtpServerGuncelle" />
                                        </Editor>
                                    </ext:Column>

                                    <ext:Column runat="server" Text="Kurum Adı" DataIndex="KurumAdi" Flex="1">
                                    </ext:Column>

                                    <ext:Column runat="server" Text="Birlik No" DataIndex="BirlikId"  Flex="1">
                                        <Editor>
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
                                        </Editor>
                                        <Renderer Fn="myRenderer"></Renderer>
                                       
                                    </ext:Column>
                                    <ext:Column runat="server" Text="Rol" DataIndex="Rol" Flex="1">
                                        <Editor>
                                            <ext:ComboBox
                                                ID="cmbRol"
                                                runat="server"
                                                Editable="false"
                                                AllowBlank="False"
                                                QueryMode="Local"
                                                TriggerAction="All"
                                                Width="200"
                                                EmptyText="Seçiniz"
                                                ValueField="Adi"
                                                DisplayField="Adi"
                                                MarginSpec="5 5 5 5">
                                            </ext:ComboBox>
                                        </Editor>
                                    </ext:Column>
                                    <%--  <ext:Column runat="server" Text="Kurum Kodu" DataIndex="KurumId" Flex="1">
                                        <Editor>
                                            <ext:ComboBox
                                                ID="Kurum"
                                                runat="server"
                                                Editable="false"
                                                AllowBlank="False"
                                                QueryMode="Local"
                                                TriggerAction="All"
                                                Width="248"
                                                ValueField="Id"
                                                DisplayField="Adi"
                                                EmptyText="Seçiniz">
                                                <Store>
                                                    <ext:Store
                                                        ID="Kurumstoreguncelle"
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

                                        </Editor>
                                    </ext:Column>--%>

                                    <ext:CommandColumn runat="server" Width="110" Text="Kullanıcı Sil">
                                        <Commands>
                                            <ext:GridCommand Icon="Delete" CommandName="Delete" Text="Sil" />
                                        </Commands>
                                        <Listeners>
                                            <Command Handler="
                                                Ext.Msg.confirm('Uyarı', 'Kullanıcıyı Silmek İstiyor Musunuz?', function(btn){if (btn=='yes'){Sil.sil(record.data.Id);alert('Kullanıcı Silme İşlemi Başarıyla Gerçekleşti!');}
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
