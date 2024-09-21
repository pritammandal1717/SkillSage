using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSage
{
    public partial class CompanyDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userId = Request.QueryString["id"];
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("Images/");

            if (CompanyLogo.HasFile)
            {
                string fileName = Path.GetFileName(CompanyLogo.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = CompanyLogo.PostedFile;
                int length = pf.ContentLength;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        CompanyLogo.SaveAs(path + fileName);
                        string name = "Images/" + fileName;

                        string userId = Request.QueryString["id"];

                        SqlConnection con = new SqlConnection(cs);
                        string query = "INSERT INTO company VALUES (@user_id, @name, @address, @logo, @url, @ein, @structure, @sector, @description, @policy)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@name", CompanyName.Text);
                        cmd.Parameters.AddWithValue("@address", CompanyAddress.Text);
                        cmd.Parameters.AddWithValue("@logo", name); // Handle file upload logic
                        cmd.Parameters.AddWithValue("@url", CompanyURL.Text);
                        cmd.Parameters.AddWithValue("@ein", CompanyEIN.Text);
                        cmd.Parameters.AddWithValue("@structure", CompanyStructure.Text);
                        cmd.Parameters.AddWithValue("@sector", CompanySector.Text);
                        cmd.Parameters.AddWithValue("@description", CompanyDescription.Text);
                        cmd.Parameters.AddWithValue("@policy", CompanyPolicy.Text);

                        con.Open();
                        int num = cmd.ExecuteNonQuery();
                        con.Close();

                        if (num > 0)
                        {
                            Response.Redirect("Login.aspx" + "?signup=100");
                        }
                    }
                    else
                    {
                        Label1.Text = "Image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "Image format is not supported !! ";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Pease Upload an image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
        }
    }
}