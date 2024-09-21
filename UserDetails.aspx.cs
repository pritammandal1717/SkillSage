using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSage
{
    public partial class UserDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] != null)
            {
                NameLabel.Text = Session["name"].ToString();
                GenderLabel.Text = Session["gender"].ToString();
                UserIdLabel.Text = Session["userid"].ToString();
                EmailLabel.Text = Session["email"].ToString();
                CheckExisting();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = FileUpload1.PostedFile;
                int length = pf.ContentLength;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        FileUpload1.SaveAs(path + fileName);
                        string name = "Images/" + fileName;

                        string query = "insert into img values(@id,@img)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@id", Session["id"]);
                        cmd.Parameters.AddWithValue("@img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("UserDetails.aspx");
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


        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = FileUpload1.PostedFile;
                int length = pf.ContentLength;
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        FileUpload1.SaveAs(path + fileName);
                        string name = "Images/" + fileName;

                        string query = "update img set image_name=@img where user_id=@id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@id", Session["id"]);
                        cmd.Parameters.AddWithValue("@img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("UserDetails.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "image format is not supported !! ";
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

        void CheckExisting()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from img where user_id= @img_id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@img_id", Session["Id"]);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {

                Button1.Visible = false;
                SqlConnection con1 = new SqlConnection(cs);
                string query1 = "select image_name from img where user_id=@user";
                SqlDataAdapter sda = new SqlDataAdapter(query1, con1);
                sda.SelectCommand.Parameters.AddWithValue("@user", Session["Id"]);
                DataTable table = new DataTable();
                sda.Fill(table);

                GridView1.DataSource = table;
                GridView1.DataBind();
                Button2.Visible = true;
            }

        }
    }
}