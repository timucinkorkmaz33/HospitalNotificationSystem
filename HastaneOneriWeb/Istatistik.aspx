<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Istatistik.aspx.cs" Inherits="HastaneOneriWeb.Istatistik" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <title>Gönderi Kaydı</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <script>
        var tipRenderer = function (storeItem, item) {
            //calculate percentage.
            var total = 0;

            App.Chart1.getStore().each(function (rec) {
                total += rec.get('CevaplananBildiriSayisi');
            });
            var total = value.data.CevaplananBildiriSayisi;
            this.setTitle(value.data.Tur + ': %' + total);
            // this.setTitle(storeItem.get('Tur') + ': ' + Math.round(storeItem.get('CevaplananBildiriSayisi') / total * 100) + '%');
        };

    </script>
    <script>
        var tpRenderer = function (storeItem, item) {
            //calculate percentage.
            var total = 0;

            App.Chart1.getStore().each(function (rec) {
                total += rec.get('BILDIRIMTURSAYISI');
            });
            var total = value.data.CevaplananBildiriSayisi;
            this.setTitle(value.data.Tur + ': %' + total);
            //this.setTitle(storeItem.get('TurAciklama') + ': ' + Math.round(storeItem.get('BILDIRIMTURSAYISI') / total * 100) + '%');
        };

    </script>

    <script type="text/javascript">
        function getRowClass(record) {
            if (record.data.Durum == 0) {
                return "red-row";
            }
            else if (record.data.Durum == 1) {
                return "blue-row";
            }
            else if (record.data.Durum == 2) {
                return "green-row";
            }
            else if (record.data.Durum == 3) {
                return "purple-row";
            }
        }
    </script>
    <style>
        .red-row .x-grid-cell, .dirty-row .x-grid-rowwrap-div {
            background-color: pink !important;
        }

        .blue-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: skyblue !important;
        }

        .green-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: aquamarine !important;
        }

        .purple-row .x-grid-cell, .new-row .x-grid-rowwrap-div {
            background: chartreuse !important;
        }
    </style>

</head>
<body>
    <%--      <marquee runat="server" id="mymarquee"></marquee>  --%>

    <script>
        var menuClick = function (val) {

        };

        var setValueClick = function (a, b, c) {
            Ext.getCmp("Menu").show();
        }
    </script>
    <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" ID="Anaekran" Layout="Border">

            <Items>
                <ext:Panel runat="server" AnchorHorizontal="%50"
                    AnchorVertical="%100" Layout="Fit" Flex="1" Region="West">
                    <Items>
                        <ext:Chart
                            ID="Chart1"
                            runat="server">
                            <Store>
                                <ext:Store
                                    ID="model"
                                    runat="server">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="AyAdi" />
                                                <ext:ModelField Name="Sayi" />
                                                <ext:ModelField Name="Yil" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>

                            <Axes>
                                <ext:NumericAxis
                                    Fields="Sayi"
                                    Grid="true"
                                    Minimum="0"
                                    Title="Yapılan Bildirim Sayısı"
                                    Maximum="200">
                                </ext:NumericAxis>

                                <ext:CategoryAxis
                                    Position="Bottom"
                                    Fields="AyAdi"
                                    Title="Aylar">
                                    <Label>
                                        <Rotate Degrees="270" />
                                    </Label>
                                </ext:CategoryAxis>

                            </Axes>

                            <Series>
                                <ext:ColumnSeries
                                    Axis="Left"
                                    Gutter="80"
                                    runat="server"
                                    XField="Yil"
                                    YField="Sayi">
                                    <Tips TrackMouse="true" runat="server" Width="140" Height="38">
                                        <Renderer Handler="this.setTitle(storeItem.get('AyAdi')+' '+storeItem.get('Yil') + ': ' + storeItem.get('Sayi') + ' Bildiri');" />
                                    </Tips>
                                    <Style Fill="#38B8BF" />
                                </ext:ColumnSeries>
                            </Series>
                        </ext:Chart>
                    </Items>
                </ext:Panel>
                <ext:Panel runat="server" Layout="Border" Flex="1" Region="Center">
                    <Items>
                        <ext:Chart
                            ID="Chart2"
                            runat="server"
                            Region="North"
                            Height="250"
                            Animate="true"
                            Shadow="true"
                            InsetPadding="60"
                            Theme="Base:gradients">
                            <LegendConfig Position="Right" />
                            <Store>
                                <ext:Store
                                    ID="pieturstore"
                                    runat="server"
                                    AutoDataBind="true">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="TurAciklama" />
                                                <ext:ModelField Name="BILDIRIMTURSAYISI" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <Series>
                                <ext:PieSeries
                                    AngleField="BILDIRIMTURSAYISI"
                                    ShowInLegend="true"
                                    Donut="0"
                                    Highlight="true"
                                    HighlightSegmentMargin="20">
                                    <Label Field="TurAciklama" Display="None" Contrast="true" Font="18px Arial" />
                                    <Tips TrackMouse="true" Width="140" Height="28">
                                        <Renderer Handler="this.setTitle(storeItem.get('TurAciklama') + ': ' + storeItem.get('BILDIRIMTURSAYISI') + ' Bildiri');" />
                                    </Tips>
                                </ext:PieSeries>
                            </Series>
                        </ext:Chart>


                        <ext:Chart
                            ID="Chart3"
                            runat="server"
                            Region="Center"
                            Height="250"
                            Animate="true"
                            Shadow="true"
                            InsetPadding="60"
                            Theme="Base:gradients">
                            <LegendConfig Position="Right" />
                            <Store>
                                <ext:Store
                                    ID="cevaplananstore"
                                    runat="server"
                                    AutoDataBind="true">
                                    <Model>
                                        <ext:Model runat="server">
                                            <Fields>
                                                <ext:ModelField Name="Tur" />
                                                <ext:ModelField Name="CevaplananBildiriSayisi" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <Series>
                                <ext:PieSeries
                                    AngleField="CevaplananBildiriSayisi"
                                    ShowInLegend="true"
                                    Donut="0"
                                    Highlight="true"
                                    HighlightSegmentMargin="20">
                                    <Label Field="Tur" Display="None" Contrast="true" Font="18px Arial" />
                                    <Tips TrackMouse="true" Width="170" Height="28">
                                        <Renderer Handler="this.setTitle(storeItem.get('Tur') + ': ' + storeItem.get('CevaplananBildiriSayisi') + ' Bildiri');" />
                                    </Tips>
                                </ext:PieSeries>
                            </Series>
                        </ext:Chart>
                    </Items>

                </ext:Panel>





            </Items>
        </ext:Viewport>
    </form>
</body>
</html>


