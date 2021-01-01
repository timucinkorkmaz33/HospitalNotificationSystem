using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HastaneOneriWeb.Rapor.Raporx
{
    public partial class Downloader : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.QueryString["dosya"];
            Response.ClearContent();

            Response.AddHeader("Content-Type", "application/pdf");
            Response.WriteFile(Server.MapPath("../xx/" + url));
            Response.End();

        }
    }
}