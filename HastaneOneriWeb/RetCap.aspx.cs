using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HastaneOneriWeb
{
    public partial class RetCap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(80, 40);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.Lavender);

            string randStr = RandomString(2);
            Session["capRand"] = randStr;

            g.DrawString(randStr, new Font(FontFamily.Families[114], 15, FontStyle.Bold),
                                                                   new SolidBrush(Color.Blue), 5, 10);

            Random rdm = new Random();
            for (int i = 0; i < bmp.Width; i++)
            {
                for (int j = 0; j < bmp.Height; j++)
                {
                    if (rdm.Next(12) == 1)
                        bmp.SetPixel(i, j, Color.Black);
                }
            }

            bmp.Save(Response.OutputStream, ImageFormat.Png);
        }

        public string RandomString(int loop)
        {
            Random rdm = new Random();
            string deger = "";

            for (int i = 0; i < loop; i++)
            {
                deger += ((char)rdm.Next('A', 'Z')).ToString() + ((char)rdm.Next('1', '9')).ToString();
            }

            return deger;
        }

    }
}