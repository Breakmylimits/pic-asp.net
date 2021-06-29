using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;


namespace WebApplication1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            show_data();
        }

        private void show_data()
        {
            DirectoryInfo d = new DirectoryInfo(MapPath("~/Files/"));
            FileInfo[] r = d.GetFiles();
            DataTable dt = new DataTable();
            dt.Columns.Add("path");
            dt.Columns.Add("name");
            for (int i = 0; i < r.Length; i++)
            {
                DataRow row = dt.NewRow();
                row["path"] = "~/Files/" + r[i].Name;
                row["name"] =  r[i].Name;
                dt.Rows.Add(row);
            }

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void btnup_click(object sender, EventArgs e)
        {
            if (Fileup1.HasFile)
            {
                string path = "~/Files/" + Guid.NewGuid().ToString() + "" + Path.GetExtension(Fileup1.FileName);
                Fileup1.SaveAs(MapPath(path));
                Response.Write("Save successfully");
                show_data();
            }

   }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            File.Delete(MapPath(e.CommandArgument.ToString()));
            Response.Write("file Delete");
            show_data();
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename="
                    + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Files/")
                    + e.CommandArgument);
                Response.End();
            }
        }



    }
}