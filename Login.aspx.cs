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
            if (Session["userid"] != null)
            {
                string role = Session["role"]?.ToString();
                RedirectToDashboard(role);
            }
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

        private void RedirectToDashboard(string role)
        {
            switch (role?.ToLower())
            {
                case "admin":
                    Response.Redirect("AdminDashboard.aspx");
                    break;
                case "user":
                    Response.Redirect("Dashboard.aspx");
                    break;
                case "recruiter":
                case "employer":
                    Response.Redirect("EmployerDashboard.aspx");
                    break;
                default:
                    Response.Redirect("Login.aspx?error=100");
                    break;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Check in employee table first
                string employeeQuery = "select * from employee where emailid = @email and password = @pass";
                SqlCommand cmd = new SqlCommand(employeeQuery, con);
                cmd.Parameters.AddWithValue("@email", UserEmail.Text);
                cmd.Parameters.AddWithValue("@pass", PasswordText.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    // If user found in employee table
                    reader.Read();
                    AuthenticateUser(reader, "employee");
                }
                else
                {
                    // Close the reader and check in employer table if not found in employee
                    reader.Close();

                    string employerQuery = "select * from employer where emailid = @email and password = @pass";
                    SqlCommand cmdEmployer = new SqlCommand(employerQuery, con);
                    cmdEmployer.Parameters.AddWithValue("@email", UserEmail.Text);
                    cmdEmployer.Parameters.AddWithValue("@pass", PasswordText.Text);

                    SqlDataReader employerReader = cmdEmployer.ExecuteReader();

                    if (employerReader.HasRows)
                    {
                        // If user found in employer table
                        employerReader.Read();
                        AuthenticateUser(employerReader, "employer");
                    }
                    else
                    {
                        // If user is not found in both tables, redirect with an error
                        Response.Redirect("Login.aspx" + "?error=" + "100");
                    }

                    employerReader.Close();
                }

                con.Close();
            }
        }

        // Helper method to authenticate user and set session variables
        private void AuthenticateUser(SqlDataReader reader, string tableName)
        {
            string role = reader["role"].ToString();

            Session["email"] = UserEmail.Text.ToString();
            Session["pass"] = PasswordText.Text.ToString();
            Session["name"] = reader["name"].ToString();
            Session["role"] = role;

            // Dynamically check if 'gender' column exists before setting it in the session
            if (ColumnExists(reader, "gender") && reader["gender"] != DBNull.Value)
            {
                Session["gender"] = reader["gender"].ToString();
            }

            Session["userid"] = reader["userid"].ToString();
            Session["Id"] = reader["Id"].ToString();

            // Redirect based on the user role
            if (role == "admin")
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else if (role == "user")
            {
                Response.Redirect("Dashboard.aspx");
            }
            else if (role == "recruiter" || (tableName == "employer" && role == "employer"))
            {
                Response.Redirect("EmployerDashboard.aspx");
            }
        }

        // Helper method to check if a column exists in the SqlDataReader
        private bool ColumnExists(SqlDataReader reader, string columnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i).Equals(columnName, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }

    }
}