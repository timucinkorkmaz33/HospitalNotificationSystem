<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KurumAtaYeniYetki.aspx.cs" Inherits="HastaneOneriWeb.KurumAtaYeniYetki" %>

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
                
                    <Items>
                        <ext:FormPanel
                            runat="server"
                            ID="fpanel1"
                            Frame="true"
                            UI="Default">
                            <Items>
                                <ext:FieldContainer
                                    runat="server"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
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
                                           </Items>
                                        </ext:FieldContainer>
                                                 <ext:Button
                                                    ID="Button1"
                                                    runat="server"
                                                    Text="Yeni Kayıt Ekle"
                                                    Icon="Accept"
                                                    Scale="Small"
                                                    IconAlign="Top">
                                                    <Listeners>
                                                        <Click Handler="Ekle.ekle();" />
                                                    </Listeners>
                                                </ext:Button>
                                         
                                

                            </Items>
                        </ext:FormPanel>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>

