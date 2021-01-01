using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using FastReport;
using FastReport.Export.Pdf;
using FastReport.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace HastaneOneriWeb
{
    public partial class RaporOlustur : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Rapor(Convert.ToInt32(Request.QueryString["param"]), "Rapor/rapor.frx","Rapor/xx/","deneme.pdf");
        }


        private void Rapor(int id,string path,string xpath,string baslik)
        {
            WebReport rapor = new WebReport();
            string str =
                "SELECT B.OlusturmaTarihi, kr.Adi,br.Adi,B.Konu,B.CevapTarihi,B.CevapMesaji, B.BasvuruYolu, B.Mesaj, B.Tur, B.EPosta, B.Gsm, B.TcId, B.Ip, B.GrupId, B.Durum, B.Ad, B.Soyad,gr.Adi " +
                " FROM bildirimler B" +
                " left join kurumlar kr on kr.id=B.KurumId" +
                " left join birimler br on br.id=B.BirimId" +
                " left join gruplar gr on gr.id=B.GrupId " + "where B.Id=" + id + "";
            var con = new MySqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            var cmd = new MySqlCommand(str, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable Tamami = new DataTable();
            da.Fill(Tamami);
            rapor.RegisterData(Tamami, "rapor");
            string pdfadi = "Bildirim_"+id;
           
            rapor.Report.Load(Server.MapPath(path));
            rapor.Report.RegisterData(Tamami, "Tamami");
            // rapor.Load("D:/Projeler/idari/cs/KarmedWeb/MerkeziGorusOneri/HastaneOneriWeb/Rapor/rapor.frx");

            if (rapor.Report.Prepare())
            {
                var pdfExport = new PDFExport
                {
                    ShowProgress = false,
                    Subject = "Subject",
                    Title = "Rapor",
                    Compressed = true,
                    AllowPrint = true,
                    EmbeddingFonts = true
                };

                rapor.Report.Export(pdfExport, Server.MapPath(xpath + pdfadi));
                pdfExport.Dispose();

                  string url = @"loadPencere('Rapor/Raporx/Downloader.aspx?dosya={0}','Rapor',1000,500);";

                //wr.Report.Print(); 
                  X.ResourceManager.AddScript(string.Format(url,pdfadi));

                //rapor.Show();


            }
        }
    }
}