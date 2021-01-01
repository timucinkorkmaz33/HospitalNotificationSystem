<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HastaneOneriWeb.Login" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>


<html>

<head runat="server">
    <title>Hastane Kaydı</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
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
            height: 180px;
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
            width: 500px;
            margin: 0 auto;
        }

        form {
            width: 500px !important;
        }

        .baslik {
        }

            .baslik h1 {
                color: #55bab7;
                background: #ffffff;
                font-size: 20px;
                text-align: center;
                padding: 5px 0 5px 0;
                font-family: Arial;
                -webkit-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
                -moz-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
                box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            }

        .wrapper {
            width: auto !important;
            margin: 100px 0 50px 0;
            -webkit-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            -moz-box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
            box-shadow: 0px 0px 4px 2px rgba(237,237,237,1);
        }
        .button { border: 1px solid #c2c2c2; color:#fff !important; font-size: 14px; font-weight: bold;border: none;background: #eeeeee;border: 1px solid #e5e5e5;
                  -webkit-box-shadow: 0px 0px 1px 0px rgba(205,205,205,1);
-moz-box-shadow: 0px 0px 1px 0px rgba(205,205,205,1);
box-shadow: 0px 0px 1px 0px rgba(205,205,205,1);
font-family: 'Open Sans', sans-serif;
        }
        .button { color: #fff;}
        #sifre {font-family: 'Open Sans', sans-serif;font-size: 20px;
}
        #kullaniciAdi input[type="text"] {border: 1px solid #ececec;  background: url('../Resource/images/kullanici.png') no-repeat left;padding-left: 40px;}
        #kullaniciAdi label {font-family: 'Open Sans', sans-serif;
 font-size: 12px;color: #6a6a6a;padding-top: 5px;
        }
        #sifre input[type="password"] { border: 1px solid #ececec;  background: url('../Resource/images/password-icon.png') no-repeat left;padding-left: 40px; }
        #sifre label {font-family: 'Open Sans', sans-serif;
 font-size: 12px;color: #6a6a6a;padding-top: 5px;}
         </style>

</head>
<body>
    <div class="top"></div>
    <div class="ortalama">
        <div class="kutu">
            <form runat="server">
                <div class="wrapper">
                    <ext:ResourceManager runat="server" />
                    <ext:Viewport ID="Ana_Ekran" runat="server">
                        <Items>
                            <ext:Panel runat="server" Border="false" Cls="wrapper">
                                <Items>
                                    <ext:Panel runat="server" MarginSpec="30 0 0 40" Border="false">
                                        <Items>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="kullaniciAdi" runat="server" AllowBlank="false" Width="400" InputType="Text" Height="30" FieldLabel="Kullanıcı Adı:" MarginSpec="5 5 5 5 ">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:Container>
                                            <ext:Container Layout="HBoxLayout" runat="server">
                                                <Items>
                                                    <ext:TextField ID="sifre" runat="server" AllowBlank="false" InputType="Password" Width="400" Height="30" FieldLabel="Şifre:" MarginSpec="5 5 5 5 " Cls="password" />
                                                
                                                </Items>
                                            </ext:Container>
                                            <ext:Button runat="server"  StyleSpec="" Text="Giriş" Width="80" Height="35"  MarginSpec="10 10 10 108" Cls="button" IconCls="accept" Scale="Large" >
                                                <Listeners>
                                                    <Click Handler="Giris.giris();"></Click>
                                                </Listeners>
                                            </ext:Button>
                                            
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
