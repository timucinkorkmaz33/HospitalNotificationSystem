<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sifredegistir.aspx.cs" Inherits="HastaneOneriWeb.sifredegistir" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Oda Tanımla</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <script src="Resources/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
</head>
<body>

    <form runat="server">
        <ext:ResourceManager runat="server" />
        <ext:Viewport ID="v1" runat="server"  Layout="BorderLayout" Resizable="false" >
    <Items>
                <ext:Panel ID="AnaPanel" runat="server" >
                    <Items>
                        <ext:TextField runat="server" ID="sifre" Flex="1" InputType="Password" MarginSpec="10 3 10 5" Width="320" FieldLabel="Sifre" />
                        <ext:TextField runat="server" ID="sifre2" Flex="1" InputType="Password" MarginSpec="10 3 10 5" Width="320" FieldLabel="Sifre Tekrar" />

                        <ext:Button runat="server" ID="accept" Icon="Accept" Text="Değiştir"  Width="120" MarginSpec="10 3 10 5" >
                            <Listeners>
                                <Click Handler="degistir.Sifredegis();" />
                            </Listeners>
                        </ext:Button>
                    </Items>
                </ext:Panel>
        </Items>
       </ext:Viewport>
    </form>
</body>
</html>
