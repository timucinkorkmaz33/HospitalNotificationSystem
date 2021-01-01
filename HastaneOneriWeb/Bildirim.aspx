<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bildirim.aspx.cs" Inherits="HastaneOneriWeb.Bildirim" %>


<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>


<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <script src="Resource/EsysJsLib.js"></script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <script>

        function checkEmail() {


            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!filter.test(App.e_mail.getValue())) {
                alert('Lütfen E-Mail Adresini doğru giriniz!');
                return false;
            }
            return true;

        }
    </script>





    <style type="text/css">
        .blockText {
            padding: 10px;
        }

        body {
            background: #f7f7f7;
        }
        
        .top {
            background: #55bab7;
            height: 320px;
            position: absolute;
            z-index: -1;
            width: 100%;
        }

        .ort {
            margin: 0 auto;
        }

        .ortalama {
            width: auto;
            margin: 0 auto;
        }

        .kutu {
            width: 520px;
            margin: 0 auto;
        }

        form {
            width: 520px !important;
        }


        .baslik {
            margin-top: 10px;
            margin-bottom: 10px;
            -webkit-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            -moz-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            background: #ffffff;
        }

            .baslik h1 {
                color: #55bab7;
                font-size: 20px;
                margin-left: -40px;

                text-align: center;
                padding: 5px 0 5px 0;
                font-family: 'Open Sans', sans-serif;
                font-weight: 700;
            }

        .wrapper {
            width: auto !important;
            margin: 5px 0 50px 0;
            -webkit-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            -moz-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
        }

        .font {
            font-size: 10px;
        }

        .baslik {
            float: left;
            width: 520px;
        }

            .baslik .baslik-bottom {
            }

                .baslik .baslik-bottom .tc {
                    float: left;
                    width: 58px;
                    height: 67px;
                    margin-top: -63px;
                    margin-left: 20px;
                }

                .baslik .baslik-bottom .banner {
                    width: 172px;
                    height: 81px;
                    float: right;
                    margin-top: -54px;
                    margin-right: -2px;
                }
                .labeldurum { margin-left: 150px;font-weight: bold;color: red;}
    </style>

</head>
<body>
    <div class="top"></div>
    <div class="ortalama">

        <div class="kutu">
           <%-- <div class="baslik">
                <div class="title">
                    <h1>Öneri Görüş Formu</h1>--%>
                    <asp:Label runat="server" ID="lblKurumAdi" CssClass="labeldurum"></asp:Label>
            <%--    </div>
                <div class="baslik-bottom">
                    <div class="tc">
                        <img src="Resource/images/bakanlik.png" />
                    </div>
                    <div class="banner">
                        <img src="Resource/images/banner.png" />
                    </div>
                </div>
            </div>--%>
            <form runat="server">
                <div class="wrapper">

                    <ext:ResourceManager runat="server" />
                    <ext:Viewport ID="Ana_Ekran" runat="server" MarginSpec="0 0 0 0" AutoScroll="True">
                        <Items>
                            <ext:Panel runat="server" Border="false" Cls="wrapper">

                                <Items>
                                    <ext:Panel runat="server" MarginSpec="30 0 0 40" Border="false">
                                        <Items>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="tcnumber" runat="server" AllowBlank="false" Width="310" Height="20" EmptyText="TC Numaranızı Giriniz" FieldLabel="TC No:" MarginSpec="5 5 5 5 ">

                                                        <Plugins>
                                                            <ext:InputMask runat="server" Mask="99999999999" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label1"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="name" runat="server" AllowBlank="false" EmptyText="Ad" Width="200" Height="20" FieldLabel="Adı" MarginSpec="5 5 5 5 " />
                                                    <ext:TextField ID="s_name" runat="server" AllowBlank="false" EmptyText="Soyad" Width="100" Height="20" MarginSpec="5 5 5 5 " />
                                                    <ext:Label
                                                        runat="server"
                                                        ID="zorunluluk"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />

                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="e_mail" runat="server" Vtype="email" AllowBlank="false" EmptyText="E-Mail Adres" Width="310" Height="20" FieldLabel="E-Mail Adres:" MarginSpec="5 5 5 5 " />
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label2"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="tel" runat="server" AllowBlank="false" EmptyText="Telefon Numaranız" Width="310" Height="20" FieldLabel="Telefon No:" MarginSpec="5 5 5 5">
                                                        <Plugins>
                                                            <ext:InputMask runat="server" Mask="(999) 999-9999" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label3"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="Konu" runat="server" AllowBlank="True" EmptyText="Konuyu Giriniz" Width="310" Height="20" FieldLabel="Konu:" MarginSpec="5 5 5 5 " />

                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:DateField ID="Tarih" runat="server" AllowBlank="True" EmptyText="Tarih Giriniz" Width="310" Height="20" FieldLabel="Tarih:" MarginSpec="5 5 5 5 " />

                                                </Items>
                                            </ext:Container>
                                             <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="Kurumlar"
                                                        runat="server"
                                                        Editable="false"
                                                        AllowBlank="False"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="Kurumlar:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        ValueField="Id"
                                                        DisplayField="Adi"
                                                        MarginSpec="5 5 5 5"
                                                        ForceSelection="True">
                                                        <Store>
                                                            <ext:Store
                                                                ID="KurumStore"
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
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label4"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="basvuru"
                                                        runat="server"
                                                        Editable="false"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="Başvuru Kanalı:"
                                                        Width="200"
                                                        EmptyText="Seçiniz"
                                                        MarginSpec="5 5 5 5">

                                                        <Items>
                                                            <ext:ListItem Text="Bilgi Edinme" Value="2" />
                                                            <ext:ListItem Text="Bimer" Value="3" />
                                                            <ext:ListItem Text="Diğer" Value="4" />
                                                            <ext:ListItem Text="Dilek Öneri Kutuları" Value="5" />
                                                            <ext:ListItem Text="Dilekçe" Value="6" />
                                                            <ext:ListItem Text="E-Mail" Value="7" />
                                                            <ext:ListItem Text="Hasta Hakları" Value="8" />
                                                            <ext:ListItem Text="İl Sağlık Müd." Value="9" />
                                                            <ext:ListItem Text="Sabim" Value="10" />
                                                        </Items>
                                                        <Listeners>
                                                            <select Handler="if(App.basvuru.getValue()=='3' || App.basvuru.getValue()=='10')
                                                                App.BasvuruNo.show();else{App.BasvuruNo.hide();}"></select>
                                                        </Listeners>
                                                    </ext:ComboBox>
                                                    <ext:NumberField runat="server" ID="BasvuruNo" EmptyText="Basvuru No" Width="108"  MarginSpec="5 5 5 -3"/>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label5"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container> 
                                           
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="Tur"
                                                        runat="server"
                                                        Editable="false"
                                                        AllowBlank="False"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="İçerik:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        MarginSpec="5 5 5 5">

                                                        <Items>
                                                            <ext:ListItem Text="Bilgi Edinme" Value="1" />
                                                            <ext:ListItem Text="Diğer" Value="2" />
                                                            <ext:ListItem Text="Görüş İsteme" Value="3" />
                                                            <ext:ListItem Text="Şikayet" Value="4" />
                                                            <ext:ListItem Text="Talep/Öneri" Value="5" />
                                                            <ext:ListItem Text="Teşekkür" Value="6" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label6"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="gruplar"
                                                        runat="server"
                                                        Editable="false"
                                                        AllowBlank="False"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="Gruplar:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        ValueField="Id"
                                                        DisplayField="Adi"
                                                        MarginSpec="5 5 5 5"
                                                        ForceSelection="True">
                                                        <Store>
                                                            <ext:Store
                                                                ID="grupstore"
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
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label7"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="birimler"
                                                        runat="server"
                                                        Editable="false"
                                                        AllowBlank="False"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="Birimler:"
                                                        EmptyText="Seçiniz"
                                                        ValueField="Id"
                                                        Width="310"
                                                        DisplayField="Adi"
                                                        MarginSpec="5 5 5 5"
                                                        ForceSelection="True">
                                                        <Store>
                                                            <ext:Store
                                                                ID="birimlerstore"
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
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label8"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                               <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbPersonelEtken"
                                                        runat="server"
                                                        Editable="false"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        AllowBlank="True"
                                                        FieldLabel="Personel Kaynaklı Etkenler:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        MarginSpec="5 5 5 5">
                                                        <Items>
                                                            <ext:ListItem Text="Diğer" Value="1" />
                                                            <ext:ListItem Text="Diğer Çalışan (sekreterlik/güvenlik/temizlik)" Value="2" />
                                                            <ext:ListItem Text="Güvenlik" Value="3" />
                                                            <ext:ListItem Text="Hekim" Value="4" />
                                                            <ext:ListItem Text="Hemşire" Value="5" />
                                                            <ext:ListItem Text="Sekreter" Value="6" />
                                                            <ext:ListItem Text="Temizlik Personeli" Value="7" />
                                                            <ext:ListItem Text="Tüm Personel" Value="8" />
                                                            <ext:ListItem Text="Üst Yönetim" Value="9" />
                                                            <ext:ListItem Text="Yardımcı sağlık Personeli" Value="10" />
                                                             <ext:ListItem Text="Danışma Personeli" Value="11" />
                                                           
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label11"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                             <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbSistemEtken"
                                                        runat="server"
                                                        Editable="false"
                                                        QueryMode="Local"
                                                        AllowBlank="True"
                                                        TriggerAction="All"
                                                        FieldLabel="Sistem Kaynaklı Etkenler:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        MarginSpec="5 5 5 5">
                                                        <Items>
                                                            <ext:ListItem Text="Başvuru ve Dava Edememe" Value="1" />
                                                            <ext:ListItem Text="Bilgilendirilmiş Rızanın alınmaması" Value="2" />
                                                            <ext:ListItem Text="Diğer" Value="3" />
                                                            <ext:ListItem Text="Dini Vecibelerini Yerine Getirememe" Value="4" />
                                                            <ext:ListItem Text="Ekipman Yetersizliği" Value="5" />
                                                            <ext:ListItem Text="Fiziki Altyapı" Value="6" />
                                                            <ext:ListItem Text="Güvenliğin Sağlanmaması" Value="7" />
                                                            <ext:ListItem Text="Hizmete Geç Ulaşım" Value="8" />
                                                            <ext:ListItem Text="Hizmetten Genel Olarak Yararlanamama" Value="9" />
                                                            <ext:ListItem Text="İletişim Bozukluğu" Value="10" />
                                                            <ext:ListItem Text="Mahremiyete uyulmaması<" Value="11" />
                                                            <ext:ListItem Text="Memnuniyet" Value="12" />
                                                            <ext:ListItem Text="MHRS/Hastane Randevu Sistemi" Value="13" />
                                                            <ext:ListItem Text="Mobbing" Value="14" />
                                                            <ext:ListItem Text="Otelcilik Hizmetleri" Value="15" />
                                                            <ext:ListItem Text="pers. çalışma koşulları /maaş  sorunu /özlük hk." Value="16" />
                                                            <ext:ListItem Text="Personel Yetersizliği" Value="17" />
                                                            <ext:ListItem Text="Sağ. Kur./ Persnl.Seçmeme/ Değiştiremme" Value="18" />
                                                            <ext:ListItem Text="Saygınlık Ve Rahatlık Görememe" Value="19" />
                                                            <ext:ListItem Text="Teknik Sorunlar" Value="20" />
                                                            <ext:ListItem Text="Tıbbi Malzeme Olmaması" Value="21" />
                                                            <ext:ListItem Text="Tıbbi Müdahele Sorunlar" Value="22" />
                                                            <ext:ListItem Text="Yeterli Bilgilendirilmeme" Value="23" />
                                                            <ext:ListItem Text="Ziyaretçi Kabul edememe/ Refakatçi bulundurumama" Value="24" />
                                                            <ext:ListItem Text="Hekimin tedavi yöntemine  müdahale" Value="25" />
                                                            <ext:ListItem Text="Hastanın nitelikli hizmet alamadığı iddası" Value="26" />
                                                            <ext:ListItem Text="Tedavi talebi" Value="27" />
                                                            <ext:ListItem Text="Bilgi belge güvenliğinin sağlanamaması" Value="28" />
                                                            <ext:ListItem Text="Hastanenin İşleyiş kurallarına uygun olmayan talepleri" Value="29" />
                                                            <ext:ListItem Text="Tıbbi malzeme bedelleri" Value="30" />
                                                            <ext:ListItem Text="SGK ile ilgili sorunlar" Value="31" />
                                                            <ext:ListItem Text="Muayene prosedürüne uymama" Value="32" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label12"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextArea ID="mesaj" runat="server" AllowBlank="false" EmptyText="Mesajınızı Giriniz" FieldLabel="Mesaj:" Width="370" Height="100" MarginSpec="5 5 5 5" />
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label9"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:Image ID="ximgCap" runat="server" Height="25" ImageUrl="~/RetCap.aspx" Width="105px" MarginSpec="0 5 0 0" />
                                                    <ext:TextField ID="xtxtCap" runat="server" Width="80" Height="25" BaseBodyCls="!important;font-size:25px"></ext:TextField>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="captcha"
                                                        Text="Hatalı Giriş"
                                                        StyleSpec="color:red; font-size:14px;"
                                                        Icon="Cancel"
                                                        IconAlign="Right"
                                                        Hidden="True" />
                                                </Items>
                                            </ext:Container>
                                             <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="Sonuc"
                                                        runat="server"
                                                        Editable="false"
                                                        QueryMode="Local"
                                                        TriggerAction="All"
                                                        FieldLabel="Sonuc:"
                                                        Width="310"
                                                        EmptyText="Seçiniz"
                                                        MarginSpec="5 5 5 5">

                                                        <Items>
                                                            <ext:ListItem Text="Adli Konu" Value="1" />
                                                            <ext:ListItem Text="Başvuran Haklı" Value="2" />
                                                            <ext:ListItem Text="Değerlendirmede" Value="3" />
                                                            <ext:ListItem Text="Diğer" Value="4" />
                                                            <ext:ListItem Text="Hasta Hak. ihlali var" Value="5" />
                                                            <ext:ListItem Text="Hasta Hak. İhlali yok" Value="6" />
                                                            <ext:ListItem Text="Kapsam Dışı" Value="7" />
                                                            <ext:ListItem Text="Kurum Haklı" Value="8" />
                                                         
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:Label
                                                        runat="server"
                                                        ID="Label13"
                                                        Text="*"
                                                        StyleSpec="color:red; font-size:14px;" />
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:Button runat="server" Text="Gönder" Icon="Accept" Width="100" Height="35" MarginSpec="10 10 10 105" ID="button">
                                                        <Listeners>
                                                            <Click Handler="Ekle.ekle();">
                                                            </Click>
                                                                   <%--    "if(checkEmail()==true)
                                                       {Ekle.ekle();}else{return 0; }">--%>
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:Container>
                                            <ext:Label
                                                runat="server"
                                                ID="Label10"
                                                Text="'*' Doldurulması zorunlu alanlar"
                                                Height="30"
                                                StyleSpec="color:red; font-size:12px;"
                                                MarginSpec="20 20 20 20" />
                                        </Items>
                                    </ext:Panel>
                                    
                                </Items>
                        </ext:Panel>
                        </Items>
                    </ext:Viewport>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

