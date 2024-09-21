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
    public partial class UserProfile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                if (!IsPostBack)
                {
                    //Response.Write("Your Role Is : " + Session["id"].ToString() + "<br>");
                    NameText.Text = Session["name"].ToString();
                    EmailText.Text = Session["email"].ToString();
                    UserIdText.Text = Session["userid"].ToString();
                    RoleText.Text = Session["role"].ToString();
                    PasswordText.Text = Session["pass"].ToString();
                    ConfirmPasswordText.Text = Session["pass"].ToString();
                    if (Session["gender"].ToString().Equals("male", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[1].Selected = true;
                    }
                    else if (Session["gender"].ToString().Equals("female", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[2].Selected = true;
                    }
                    else if (Session["gender"].ToString().Equals("others", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[3].Selected = true;
                    }
                    else
                    {
                        GenderDrop.Items[0].Selected = true;
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "update employee set name=@name, emailid=@email, gender=@gender, password=@password, userid=@userid where Id=@id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", NameText.Text);
            cmd.Parameters.AddWithValue("@email", EmailText.Text);
            cmd.Parameters.AddWithValue("@gender", GenderDrop.SelectedValue);
            cmd.Parameters.AddWithValue("@userid", UserIdText.Text);
            cmd.Parameters.AddWithValue("@password", PasswordText.Text);
            cmd.Parameters.AddWithValue("@id", Session["Id"].ToString());
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Redirect("Dashboard.aspx");
            }
            con.Close();
        }
    }
}