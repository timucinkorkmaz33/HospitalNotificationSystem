<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KurumKaydetPanel.aspx.cs" Inherits="HastaneOneriWeb.KurumKaydetPanel" %>

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
                                <ext:ComboBox
                                    ID="BirlikId"
                                    runat="server"
                                    Editable="false"
                                    AllowBlank="False"
                                    QueryMode="Local"
                                    TriggerAction="All"
                                    FieldLabel="Birlik Id:"
                                    ValueField="Id"
                                    DisplayField="Adi"
                                    EmptyText="Seçiniz"
                                    MarginSpec="10 3 0 5"
                                    ForceSelection="True"
                                    MatchFieldWidth="True">
                                    <Store>
                                        <ext:Store
                                            ID="Birlikstore"
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

                                <ext:TextField runat="server" AllowBlank="False" ID="Adi" Cls="textField" FieldLabel="Kurum Adı" MarginSpec="10 3 0 5" />
                                <ext:TextField runat="server" ID="SkrsKodu" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Skrs Kodu" />
                                <ext:TextField runat="server" ID="HostAdresi" Cls="textField" AllowBlank="False" MarginSpec="10 3 0 5" FieldLabel="Host Adresi" />

                            </Items>

                            <Items>
                                <ext:TextField runat="server" ID="SMTPServer" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="SMTP Server" />
                                <ext:TextField runat="server" ID="SMTPUser" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="SMTP User" />
                                <ext:TextField runat="server" ID="SMTPPass" AllowBlank="False" Cls="textField" FieldLabel="SMTP Sifre" MarginSpec="10 3 0 5" />
                                <ext:TextField runat="server" ID="EMail" AllowBlank="False" Cls="textField" FieldLabel="EMail" MarginSpec="10 3 0 5" />
                            </Items>
                            <Items>
                                <ext:Button
                                    ID="Kaydet"
                                    runat="server"
                                    Text="Kullanıcı Ekle"
                                    IconCls="save"
                                    Scale="Large"
                                    MarginSpec="10 10 10 10">
                                    <Listeners>
                                        <Click Handler="Ekle.ekle();" />
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
