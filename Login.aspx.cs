using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace SkillSage
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string qs = Request.QueryString["error"];
                string qs1 = Request.QueryString["signup"];
                if (qs != null)
                {
                    Label1.Text = "Invalid User Name or Password ";
                    Label1.ForeColor = Color.Red;
                }
                if (qs1 == "100")
                {
                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Please Wait Until You Are Verified By Admin";
                }
                if (qs1 != null)
                {
                    Label1.ForeColor = Color.Green;
                    Label1.Text = "You Have Successfully Signed Up";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from employee where emailid = @email and password = @pass";
            SqlCommand sqlCommand = new SqlCommand(query, con);
            sqlCommand.Parameters.AddWithValue("@email", UserEmail.Text);
            sqlCommand.Parameters.AddWithValue("@pass", PasswordText.Text);
            con.Open();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                string role = reader["role"].ToString();

                Session["email"] = UserEmail.Text.ToString();
                Session["pass"] = PasswordText.Text.ToString();
                Session["name"] = reader["name"].ToString();
                Session["role"] = role;
                Session["gender"] = reader["gender"].ToString();
                Session["userid"] = reader["userid"].ToString();
                Session["Id"] = reader["Id"].ToString();

                if (role == "admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else if (role == "user")
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx" + "?error=" + "100");
            }
            con.Close();
        }
    }
}