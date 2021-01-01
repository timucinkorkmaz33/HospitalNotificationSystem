<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RaporOlustur.aspx.cs" Inherits="HastaneOneriWeb.RaporOlustur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>

        function loadPencere(url, title, width, height) {
            Ext.create("Ext.window.Window", {
                hidden: true,
                width: width,
                height: height,
                renderTo: Ext.getBody(),
                layout: "fit",
                modal: true,
                draggable: true,
                plain: true,
                constrain: false,
                shadow: false,
                title: title,
                autoscroll: false,
                closable: false,
                header: false,
                border:false,
        
                    loader:
                    {
                        autoLoad: true,
                        renderer: "frame",
                        url: url,
                        loadMask: {
                            showMask: true,
                            msg: "Yükleniyor..."
                        }
                    },
                    listeners: {
                        beforeclose: function (s, e) {
                            s.destroy();
                        }
                    }
                }
            ).show();
        }

    </script>
    <link href="Resource/KardelenStyle.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager runat="server"></ext:ResourceManager>
    <div>
    
    </div>
    </form>
</body>
</html>
