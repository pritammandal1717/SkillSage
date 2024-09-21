using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillSage
{
    public partial class SignUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into employee values(@name, @emailid, @gender, @role, @password, @userid)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@userid", UserId.Text);
            cmd.Parameters.AddWithValue("@name", UserName.Text);
            cmd.Parameters.AddWithValue("@emailid", UserEmail.Text);
            cmd.Parameters.AddWithValue("@gender", UserGender.SelectedValue);
            cmd.Parameters.AddWithValue("@role", "user"); //UserRole.SelectedValue
            cmd.Parameters.AddWithValue("@password", UserPassword.Text);
            con.Open();

            int num = cmd.ExecuteNonQuery();
            if (num > 0)
            {
                Response.Redirect("Login.aspx" + "?signup=10");
            }

            con.Close();
        }
    }
}