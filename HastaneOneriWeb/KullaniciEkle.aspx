<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciEkle.aspx.cs" Inherits="HastaneOneriWeb.KullaniciEkle1" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script>
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
                <ext:Panel runat="server" Layout="Fit" Region="Center" Flex="1">
                    <Items>

                        <ext:ButtonGroup runat="server" Title="Kayıt" Height="90" Columns="4" Flex="1">

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

                                <ext:Button
                                    ID="Button4"
                                    runat="server"
                                    Text="Kullanıcı Ekle"
                                    IconCls="save"
                                    Scale="Large"
                                    MarginSpec="10 10 10 10">
                                    <Listeners>
                                        <Click Handler="Ekle.ekle(App.KullaniciGrd.getSelectionModel().getSelection()[0].data);" />
                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:ButtonGroup>

                    </Items>
                </ext:Panel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>

