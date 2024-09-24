using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SkillSage
{
    public partial class EmployerDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    LoadEmployerDetails();
                    LoadCompanyDetails();
                    //LoadPostedJobs();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadEmployerDetails()
        {
            // Fetch employer details using the session user ID
            string userId = Session["userid"].ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT name, emailid, emprole FROM employer WHERE userid=@userId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userId", userId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblEmployerName.Text = reader["name"].ToString();
                    lblEmployerNameDetail.Text = reader["name"].ToString();
                    lblEmployerEmail.Text = reader["emailid"].ToString();
                    lblEmployerRole.Text = reader["emprole"].ToString();
                }
                con.Close();
            }
        }

        private void LoadCompanyDetails()
        {
            // Fetch company details associated with the employer
            string userId = Session["userid"].ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT name, address, sector FROM company WHERE user_id=@userId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userId", userId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblCompanyName.Text = reader["name"].ToString();
                    lblCompanyLocation.Text = reader["address"].ToString();
                    lblCompanyIndustry.Text = reader["sector"].ToString();
                }
                con.Close();
            }
        }

        //private void LoadPostedJobs()
        //{
        //    // Load posted jobs for this employer
        //    string userId = Session["userid"].ToString();

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "SELECT JobId, JobTitle, Location, PostedDate FROM jobs WHERE employer_id=@userId";
        //        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //        sda.SelectCommand.Parameters.AddWithValue("@userId", userId);

        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);

        //        GridViewPostedJobs.DataSource = dt;
        //        GridViewPostedJobs.DataBind();
        //    }
        //}

        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            // Redirect to job posting page
            Response.Redirect("PostJob.aspx");
        }
    }
}
