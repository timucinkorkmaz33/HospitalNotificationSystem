<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KurumKaydet.aspx.cs" Inherits="HastaneOneriWeb.KurumKaydet" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <script>
        var  myRenderer= function(value, metadata, record) {
            return record.data.BirlikAdi;
        }

        function Setdate() {


            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
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
                    <TopBar>
                        <ext:Toolbar runat="server">
                            <Items>
                                <ext:Button
                                    ID="btn1"
                                    runat="server"
                                    Text="Yeni Kurum"
                                    IconCls="add1"
                                    Scale="Large"
                                    MarginSpec="0 5 5 5">
                                    <Listeners>
                                        <Click Handler="loadPencere('KurumKaydetPanel.aspx','Kurum Kaydet',1060,180)" />
                                    </Listeners>
                                </ext:Button>
                           
                                <ext:ToolbarSeparator runat="server" />
                                <ext:Button
                                    ID="Button2"
                                    runat="server"
                                    Text="Kayıt Güncelle"
                                    IconCls="update"
                                    Scale="Large"
                                    MarginSpec="0 5 5 5">
                                    <Listeners>
                                        <Click Handler="App.kurumstore.sync();window.location.reload();">
                                        </Click>

                                    </Listeners>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Items>
                        <ext:FormPanel
                            runat="server"
                            ID="fpanel1"
                            Frame="true"
                            AutoScroll="True"
                            UI="Default">
                            <Items>
                                <ext:FieldContainer
                                    runat="server"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <%-- <ext:ComboBox
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
                                                    ForceSelection="True">
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

                                                </ext:ComboBox>--%>

                                        <%--  <ext:TextField runat="server" AllowBlank="False" ID="Adi" Cls="textField"  FieldLabel="Kurum Adı" MarginSpec="10 3 0 5" />
                                        <ext:TextField runat="server" ID="SkrsKodu" AllowBlank="False" Cls="textField" MarginSpec="10 3 0 5" FieldLabel="Skrs Kodu" />
                                        <ext:TextField runat="server" ID="HostAdresi" Cls="textField" AllowBlank="False"  MarginSpec="10 3 0 5" FieldLabel="Host Adresi" />--%>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    runat="server"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <%-- <ext:TextField runat="server" ID="SMTPServer" AllowBlank="False" Cls="textField"  MarginSpec="10 3 0 5" FieldLabel="SMTP Server" />
                                        <ext:TextField runat="server" ID="SMTPUser" AllowBlank="False" Cls="textField"  MarginSpec="10 3 0 5" FieldLabel="SMTP User" />
                                        <ext:TextField runat="server" ID="SMTPPass" AllowBlank="False" Cls="textField" FieldLabel="SMTP Sifre" MarginSpec="10 3 0 5" />
                                        <ext:TextField runat="server" ID="EMail" AllowBlank="False" Cls="textField"  FieldLabel="EMail" MarginSpec="10 3 0 5" />--%>
                                    </Items>
                                </ext:FieldContainer>

                            </Items>

                            <Items>
                                <ext:GridPanel
                                    runat="server"
                                    ID="KurumGrd"
                                    AutoScroll="true">
                                         <BottomBar>
                        <ext:PagingToolbar runat="server">
                        </ext:PagingToolbar>
                    </BottomBar>
                                    <Store>
                                        <ext:Store
                                            ID="kurumstore"
                                            runat="server"
                                            PageSize="16"
                                            OnBeforeStoreChanged="kurumstore_AfterRecordUpdated">
                                            <Model>
                                                <ext:Model runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="Id" />
                                                        <ext:ModelField Name="BirlikId" />
                                                        <ext:ModelField Name="BirlikAdi" />
                                                        <ext:ModelField Name="Adi" />
                                                        <ext:ModelField Name="SkrsKodu" />
                                                        <ext:ModelField Name="SMTPServer" />
                                                        <ext:ModelField Name="SMTPUser" />
                                                        <ext:ModelField Name="SMTPPass" />
                                                        <ext:ModelField Name="Aktif" Type="Boolean" />
                                                        <ext:ModelField Name="DnsName" />
                                                        <ext:ModelField Name="EMail" />
                                                        <ext:ModelField Name="OlusturmaTarihi" DateFormat="dd.MM.yyyy" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel runat="server">
                                        <Columns>

                                            <ext:Column runat="server" Text="Birlik No" DataIndex="BirlikId" Flex="1">
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="BirlikGuncelle"
                                                        runat="server"
                                                        Editable="false"
                                                        AllowBlank="False"
                                                        QueryMode="Local"
                                                        ValueField="Id"
                                                        DisplayField="Adi"
                                                        EmptyText="Seçiniz"
                                                        Width="100">
                                                        <Store>
                                                            <ext:Store
                                                                ID="BirlikGuncelleStore"
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
                                            <ext:Column runat="server" Text="Kurum Adı" DataIndex="Adi" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="KurumAdiGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="Skrs Kodu" DataIndex="SkrsKodu" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="SkrsGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="SMTPServer" DataIndex="SMTPServer" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="SmtpServerGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="SMTPUser" DataIndex="SMTPUser" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="SmtpUserGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="SMTPPass" DataIndex="SMTPPass" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="SmtpPassGuncelle" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="DnsName" DataIndex="DnsName" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="TextField1" />
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column runat="server" Text="EMail" DataIndex="EMail" Flex="1">
                                                <Editor>
                                                    <ext:TextField runat="server" ID="TextField2" />
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
                                                         Ext.Msg.confirm('Uyarı', 'Kurum Silmek İstiyor Musunuz?', function(btn){if (btn=='yes'){Sil.sil(record.data.Id);alert('Kurum Silme İşlemi Başarıyla Gerçekleşti!');}
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
