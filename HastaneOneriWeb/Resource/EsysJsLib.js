function loadPencereByMetodlu(url, title, width, height, runmethod) {
    Ext.create("Ext.window.Window", {
        id: "Pencere",
        hidden: true,
        width: width,
        height: height,
        renderTo: Ext.getBody(),
        layout: "fit",
        modal: true,
        draggable: true,
        plain: true,
        constrain: true,
        shadow: true,
        maximizable: true,
        title: title,
        autoscroll: true,
        resizable: true,
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
            beforeclose: function () {
                Ext.net.DirectMethod.request(runmethod);
            }
        }
    }
);
    App.Pencere.show();
};
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
        constrain: true,
        shadow: true,
        title: title,
        autoscroll: true,
        maximizable: true,
        resizable: true,
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


function loadparentWindow(url, title, width, height, runmethod) {
    parent.Ext.create("Ext.window.Window", {
        hidden: true,
        width: width,
        height: height,
        id: "Pencere",
        renderTo: Ext.getBody(),
        layout: "fit",
        modal: true,
        draggable: true,
        plain: true,
        constrain: true,
        shadow: true,
        title: title,
        autoscroll: true,
        resizable: true,
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
            beforeclose: function () {
                Ext.net.DirectMethod.request(runmethod);
            }
        }
    }
);

    App.Pencere.show();
}
function loadFullScreenWindow(purl, title, max) { //modify by 22.10.2013 merol 
    parent.Ext.create("Ext.window.Window", {
        id: "Pencere",
        hidden: true,
        draggable: true,
        maximized: max,
        width: 600,
        height: 500,
        idMode: 'Static',
        title: title,
        layout: 'fit',
        resizable: true,
        disableCaching: false,
        modal: true,
        constrain: true,
        minimizable: true,
        maximizable: true,
        autoLoad: {
            url: purl,
            nocache: true,
            renderer: 'frame',
            loadMask: {
                showMask: true,
                msg: "Yükleniyor..."
            }
        }
    }).show();
}

function maskla(title) {
    Ext.net.Mask.show({ msg: title });
};
var getSelection = function (grid) {
    var selection = grid.getSelectionModel().getSelection(),
        xdata = [];
    Ext.each(selection, function (r) {
        xdata.push(r.data);
    });
    return xdata;
};


function IconMesaj(baslik, metin) {
    Ext.Msg.show({
        title: baslik,
        msg: metin,
        width: 300,
        buttons: Ext.Msg.OK,
        icon: Ext.MessageBox.WARNING
    });
};

function Messenger(xhtml, Title) {
    Ext.net.Notification.show({
        listeners: {
            beforeshow: {
                fn: function (el) {
                    //#{BarLabel}.setText(Ext.Date.format(new Date(), 'd.m.Y H:i:s'));
                }
            }
        },
        iconCls: 'icon-information',

        closeVisible: true,
        autoHide: false,
        hideDelay: 20000,
        height: 400,
        html: xhtml,
        width: 400,
        title: Title


    });

}


var filterData = function (store, value) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    store.filter([{
        fn: function (record) {
            if (value == 0) {
                return record.get('randevuTarih');
            }
            if (value == 1) {
                return !record.get('randevuTarih');
            } else {
                return record;
            }

        }
    }]);
};

var filterAtamalar = function (store, value) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    store.filter([{
        fn: function (record) {
            if (value == 0) {
                return record;
            }
            if (value == 1) {
                return record.get('onay') == true;

            }
            if (value == 2) {
                return record.get('onay') == false && !record.get('iptalTarihi');
            }
            if (value == 3) {
                return record.get('iptalTarihi');
            }
            else {
                return record;
            }

        }
    }]);
};

var filterDemirbasTakip = function (store, value) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    store.filter([{
        fn: function (record) {
            if (value == 1) {
                return record.get('GeriAlmaTarihi');
            }
            if (value == 2) {
                return !record.get('GeriAlmaTarihi');
            } else {
                return record;
            }

        }
    }]);
};
var filterByIndex = function (store, value, dataindex) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    store.filter([{
        fn: function (record) {
            var val = record.get(dataindex).toString();
            return val.toLowerCase().contains(value.toLowerCase());
        }
    }]);

}

function addTab(tabPanel, url, baslik) {

    tabPanel.add({
        title: baslik,
        closable: true,
        loader: {
            url: url,
            renderer: "frame",
            loadMask: {
                showMask: true,
                msg: "Yükleniyor..."

            }
        }
    });
}
//-------------------------KULLANICI UYARI MESAJLARI-------------------------------------------------------
function Uyari(aBaslik, aMesaj) {
    Ext.Msg.show({
        title: aBaslik,
        msg: aMesaj,
        icon: Ext.MessageBox.WARNING,
        buttons: Ext.Msg.OK
    });
};

function Hata(aBaslik, aMesaj) {
    Ext.Msg.show({
        title: aBaslik,
        msg: aMesaj,
        icon: Ext.MessageBox.ERROR,
        buttons: Ext.Msg.OK
    });
};

function Mesaj(aBaslik, aMesaj) {
    Ext.Msg.show({
        title: aBaslik,
        msg: aMesaj,
        icon: Ext.MessageBox.INFO,
        buttons: Ext.Msg.OK
    });
};
function InfoBox(baslik, metin) {
    Ext.Msg.show({
        title: baslik,
        msg: metin,
        width: 300,
        icon: Ext.MessageBox.INFO
    });
};
//------------------------------------------------------------------------------------------------------------------------

var dataKaydet = function (grid, hiddenFormat) {
    hiddenFormat.setValue(Ext.encode(grid.getRowsValues({ selectedOnly: false })));
};

function TcKontrol(KimlikNo) {
    KimlikNo = String(KimlikNo);
    if (!KimlikNo.match(/^[0-9]{11}$/))
        return false;

    pr1 = parseInt(KimlikNo.substr(0, 1));
    pr2 = parseInt(KimlikNo.substr(1, 1));
    pr3 = parseInt(KimlikNo.substr(2, 1));
    pr4 = parseInt(KimlikNo.substr(3, 1));
    pr5 = parseInt(KimlikNo.substr(4, 1));
    pr6 = parseInt(KimlikNo.substr(5, 1));
    pr7 = parseInt(KimlikNo.substr(6, 1));
    pr8 = parseInt(KimlikNo.substr(7, 1));
    pr9 = parseInt(KimlikNo.substr(8, 1));
    pr10 = parseInt(KimlikNo.substr(9, 1));
    pr11 = parseInt(KimlikNo.substr(10, 1));

    if ((pr1 + pr3 + pr5 + pr7 + pr9 + pr2 + pr4 + pr6 + pr8 + pr10) % 10 != pr11)
        return false;
    if (((pr1 + pr3 + pr5 + pr7 + pr9) * 7 + (pr2 + pr4 + pr6 + pr8) * 9) % 10 != pr10)
        return false;
    if (((pr1 + pr3 + pr5 + pr7 + pr9) * 8) % 10 != pr11)
        return false;

    return true;
}


function turSec(value) {
    var result;
    if (value == 0) {
        result = 'Demirbaş';
    } else if (value == 1) {
        result = 'Sarf';
    } else if (value == 2) {
        result = 'İlaç';
    }
    return result;
}


var filterDemirbas = function (store, value, ref) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    if (ref == 1 && App.cmbTur.getValue() != null) {
        filterMalzemeTur(store, App.cmbTur.getValue(), 2);
    }
    store.filter([
        {
            fn: function (record) {
                if (value == 0) {
                    return record.get('gerialmaTarihi');
                }
                if (value == 1) {
                    return !record.get('gerialmaTarihi');
                }
                if (value == 2) {
                    return record.get('arizali');
                } else {
                    return record;
                }

            }
        }
    ]);
};
var filterMalzemeTur = function (store, value, ref) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    if (ref == 1 && App.cmbFiltrele.getValue() != null) {
        filterDemirbas(store, App.cmbFiltrele.getValue(), 2);
    }
    store.filter([
        {
            fn: function (record) {
                return record.get('tur') == value;
            }
        }
    ]);
};

//----this script allows users to filter gridpanel by its all columns simultaneously. modified by Azadinho------------------
function filtrele(store, aranacak) {
    var fields = store.model.getFields();
    store.clearFilter();
    var filters = [
         new Ext.util.Filter({
             filterFn: function (item) {
                 for (var i = 0; i < fields.length; i++) {
                     var fieldD = item.get(fields[i].name);
                     var indexofI = aranacak.indexOf('i');
                     if (indexofI > -1)
                         aranacak = aranacak.replaceAt(indexofI, "İ");
                     if (fieldD != null && fieldD != '' && fieldD.toString().toUpperCase().indexOf(aranacak.toUpperCase()) > -1) {
                         return true;
                     }
                 }
                 return false;
             }
         })
    ];
    store.filter(filters);
}
String.prototype.replaceAt = function (index, character) {
    return this.substr(0, index) + character + this.substr(index + character.length);
}


//--comboboxda içinde arama(sub search) yı da sağlayan arama scriptidir.Author Azadinho----
var ComboSearch = function (combo) {
    var v = combo.getRawValue();
    filtrele(combo.store, v);
    combo.onLoad();
};


function SagdanNotification(title, text) {

    Ext.net.Notification.show({
        iconCls: 'icon-information',
        hideFx: {
            args: ['r', {}],
            fxName: 'slideOut'
        },
        showFx: {
            args: ['r', {}],
            fxName: 'slideIn'
        },
        pinEvent: 'click',
        bodyStyle: 'padding:10px',
        shadow: false,
        height: 100,
        width: 150,
        html: text,
        title: title
    });
}


function Confirm(callback) {
    Ext.Msg.confirm('Onay', 'İlgili Kayıt Silinecek Devam Edilsin mi? ', function (btn, text) {
        if (btn == 'yes') {
            callback();
        }
    });
}


var filterByMultipleFields = function (store, value) {
    store.suspendEvents();
    store.clearFilter();
    store.resumeEvents();
    if (value) {
        var matcher = new RegExp(Ext.String.escapeRegex(value), "i");
        store.filter([
            {
                filterFn: function (record) {

                    return matcher.test(record.get('ad')) ||
                        matcher.test(record.get('soyAd')) ||
                        matcher.test(record.get('userName'));
                }

            }
        ]);


    }
}

var dişnoları = [];
function Checked_Changed(chk, hdndiştürü) {
    var firstdigit = (chk.tabIndex / 10).toString()[0];

    if (chk.checked) {
        switch (hdndiştürü) {
            case "TekDis":
                chk.setValue(true);
                if (!Ext.Array.contains(dişnoları, chk.tabIndex))
                    dişnoları.push(chk.tabIndex);
                break;
            case "YarimCene":
                if (firstdigit == 1 || firstdigit == 2 || firstdigit == 3 || firstdigit == 4) {
                    for (var i = 1; i < 9; i++) {
                        var ch = Ext.getCmp("chk" + firstdigit + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                else {
                    for (var i = 1; i < 6; i++) {
                        var ch = Ext.getCmp("chk" + firstdigit + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                break;

            case "TamCene":
                if (firstdigit == 1 || firstdigit == 2) {
                    for (var i = 11; i < 29; i++) {
                        if (i == 19 || i == 20)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                if (firstdigit == 3 || firstdigit == 4) {
                    for (var i = 31; i < 49; i++) {
                        if (i == 39 || i == 40)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                if (firstdigit == 5 || firstdigit == 6) {
                    for (var i = 51; i < 66; i++) {
                        if (i == 56 || i == 57 || i == 58 || i == 59 || i == 60)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                if (firstdigit == 7 || firstdigit == 8) {
                    for (var i = 71; i < 86; i++) {
                        if (i == 76 || i == 77 || i == 78 || i == 79 || i == 80)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }
                break;

            case "TumAgiz":
                if (firstdigit == 5 || firstdigit == 6 || firstdigit == 7 || firstdigit == 8) {
                    for (var i = 71; i < 86; i++) {
                        if (i == 76 || i == 77 || i == 78 || i == 79 || i == 80 || i == 56 || i == 57 || i == 58 || i == 59 || i == 60)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(true);
                        if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                            dişnoları.push(ch.tabIndex);
                    }
                }

                for (var i = 11; i < 49; i++) {
                    if (i == 19 || i == 20 || i == 39 || i == 40)
                        continue;
                    var ch = Ext.getCmp("chk" + i.toString());
                    ch.setValue(true);
                    if (!Ext.Array.contains(dişnoları, ch.tabIndex))
                        dişnoları.push(ch.tabIndex);
                }
                break;
        }
    }
    else {

        switch (hdndiştürü) {
            case "TekDis":
                chk.setValue(false);
                dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                break;
            case "YarimCene":
                if (firstdigit == 5 || firstdigit == 6 || firstdigit == 7 || firstdigit == 8)
                    var j = 6;
                else j = 9;
                for (var i = 1; i < j; i++) {
                    var ch = Ext.getCmp("chk" + firstdigit + i.toString());
                    ch.setValue(false);
                    dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                }
                break;

            case "TamCene":
                if (firstdigit == 1 || firstdigit == 2) {
                    for (var i = 11; i < 29; i++) {
                        if (i == 19 || i == 20)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(false);
                        dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                    }
                }
                if (firstdigit == 3 || firstdigit == 4) {
                    for (var i = 31; i < 49; i++) {
                        if (i == 39 || i == 40)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(false);
                        dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                    }
                }
                if (firstdigit == 5 || firstdigit == 6) {
                    for (var i = 51; i < 66; i++) {
                        if (i == 56 || i == 57 || i == 58 || i == 59 || i == 60)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(false);
                        dişnoları.splice(dişnoları.indexOf(ch.tabIndex), 1);
                    }
                }
                if (firstdigit == 7 || firstdigit == 8) {
                    for (var i = 71; i < 86; i++) {
                        if (i == 76 || i == 77 || i == 78 || i == 79 || i == 80)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(false);
                        dişnoları.splice(dişnoları.indexOf(ch.tabIndex), 1);
                    }
                }
                break;

            case "TumAgiz":
                if (firstdigit == 5 || firstdigit == 6 || firstdigit == 7 || firstdigit == 8) {
                    for (var i = 71; i < 86; i++) {
                        if (i == 76 || i == 77 || i == 78 || i == 79 || i == 80 || i == 56 || i == 57 || i == 58 || i == 59 || i == 60)
                            continue;
                        var ch = Ext.getCmp("chk" + i.toString());
                        ch.setValue(false);
                        dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                    }
                }

                for (var i = 11; i < 49; i++) {
                    if (i == 19 || i == 20 || i == 39 || i == 40)
                        continue;
                    var ch = Ext.getCmp("chk" + i.toString());
                    ch.setValue(false);
                    dişnoları.splice(dişnoları.indexOf(chk.tabIndex), 1);
                }
                break;
        }
    }
}

function disnolari() {
    return dişnoları;
}

function toggleFullScreen(btn) {
    if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
            document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
            document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
        if (btn) {
            btn.setText("Normal Ekran");
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
        if (btn) {
            btn.setText("Tam Ekran");
        }
    }
}

//function BtnClick()
//{
//    Ext.apply(Ext,
//        {
//            getCmps: function ()
//            {
//            var arr = [];

//            Ext.each(arguments, function (id, index, allIds) {
//                if (tmp = Ext.getCmp(id)) {
//                    arr.push(tmp);
//                }
//            });
//            return (arr);
//          }

//    });

//    myCmps = Ext.getCmps('L0');
//    Istem.TamamClick(Ext.encode(myCmps[0].getForm().getValues(false, true, true, true)));
//}



//-----------------------------------------------------------------------------------------


//exSorgula = function exSorgula(store, grid) {
//    for (var i = 0; i < store.count() ; i++)
//    {
//        var record = getSelection(grid)[0];
//        Sorgula.TopluSorgula(record,true, {
//            success: function (result) {
//                if (result) {
//                    //store.set("olumtarihi", result);
//                    grid.getSelectionModel().selectNext();
//                }
//            }
//        });
//    }
//}