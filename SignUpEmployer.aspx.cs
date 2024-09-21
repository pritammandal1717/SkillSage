using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSage
{
    public partial class SignUpEmployer : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string path = Server.MapPath("Images/");

            if (UserImage.HasFile)
            {
                string fileName = Path.GetFileName(UserImage.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = UserImage.PostedFile;
                int length = pf.ContentLength;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        UserImage.SaveAs(path + fileName);
                        string name = "Images/" + fileName;


                        string query = "insert into employer values(@name, @emailid, @emprole, @role, @password, @userid, @image,'0')";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@userid", UserId.Text);
                        cmd.Parameters.AddWithValue("@name", UserName.Text);
                        cmd.Parameters.AddWithValue("@emailid", UserEmail.Text);
                        cmd.Parameters.AddWithValue("@emprole", UserRole.SelectedValue);
                        cmd.Parameters.AddWithValue("@role", "employer"); //UserRole.SelectedValue
                        cmd.Parameters.AddWithValue("@password", UserPassword.Text);
                        cmd.Parameters.AddWithValue("@image", name);

                        con.Open();

                        int num = cmd.ExecuteNonQuery();
                        if (num > 0)
                        {
                            Response.Redirect("CompanyDetails.aspx?id=" + HttpUtility.UrlEncode(UserId.Text));
                        }

                        con.Close();
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