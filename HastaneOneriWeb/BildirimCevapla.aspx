<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BildirimCevapla.aspx.cs" Inherits="HastaneOneriWeb.BildirimCevapla" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Oda Tanımla</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <script src="Resources/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
   
    <%--  arama java script--%>
    <script type="text/javascript">
        function Filtrele(mystore, aranacak) {
            var fields = mystore.model.getFields();
            mystore.clearFilter();
            var filters = [
                 new Ext.util.Filter({
                     filterFn: function (item) {
                         for (var i = 0; i < fields.length; i++) {
                             var fieldD = item.get(fields[i].name);
                             if (fieldD != null && fieldD != '' && fieldD.toString().toLocaleLowerCase().indexOf(aranacak.toLocaleLowerCase()) > -1) {
                                 return true;
                             }
                         }
                         return false;
                     }
                 })
            ];
            mystore.filter(filters);
        }
    </script>

</head>
<body>
      
    <form runat="server">
        
        <ext:ResourceManager runat="server" />
        <ext:Viewport ID="v1" runat="server"  Layout="BorderLayout" Resizable="False">
    <Items>
                <ext:Panel ID="AnaPanel" runat="server" >
                    <Items>
                      
                        <ext:TextField runat="server" ID="mail_adres" Flex="1" MarginSpec="10 3 10 5" Width="320" FieldLabel="E-Mail" />
                        
                        <ext:ComboBox
                            ID="basvuru"
                            runat="server"
                            Editable="false"
                            QueryMode="Local"
                            TriggerAction="All"
                            FieldLabel="Cevap Yolu:"
                            Flex="1"
                            Width="400"
                            EmptyText="Seçiniz"
                            MarginSpec="5 5 5 5">

                            <Items>
                                <ext:ListItem Text="E-Mail" Value=1 />
                                <ext:ListItem Text="Faks" Value=2 />
                                <ext:ListItem Text="Resmi Yazı" Value=3 />
                                
                            </Items>
                        </ext:ComboBox>
                        <ext:TextArea runat="server" ID="message" Flex="1" FieldLabel="Mesaj"  Width="520" Height="200" MarginSpec="0 30 3 5"/>
                        <ext:Button runat="server" ID="accept" Icon="Accept" Text="Sonuçlandır"  Width="120" MarginSpec="10 3 10 5" >
                            <Listeners>
                                <Click Handler="mail_gonder.gonder();" />
                            </Listeners>
                        </ext:Button>
                    </Items>
                </ext:Panel>
        </Items>
       </ext:Viewport>
    </form>
</body>
</html>
