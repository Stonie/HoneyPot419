using System;
using System.IO;

namespace HoneyPot419
{
    /// <summary>
    /// You might want to change the guid and pictures
    /// </summary>
    public partial class Save : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pic = Request.Form["pic"];
            if (pic != null)
            {
                byte[] data = Convert.FromBase64String(pic);
                string filename = Path.Combine(Server.MapPath(@"/F7B31110-A55A-4def-AEC5-E476AF1105B5"), Guid.NewGuid() + ".jpg");
                File.WriteAllBytes(filename, data);
            }
        }
    }
}
