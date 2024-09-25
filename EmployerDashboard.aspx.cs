using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Reflection.Emit;

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
                    LoadEmployeePostedJobs();
                    LoadJobInterestRequests();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            try
            {
                string qs = Request.QueryString["posted"];
                if (qs != null)
                {
                    Message.Text = "Job Posted Successfully";
                    Message.ForeColor = Color.Green;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
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

        private void LoadEmployeePostedJobs()
        {
            try
            {
                string userId = Session["userid"].ToString();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT Id, title, description, skills, duration, payment FROM job WHERE employer_id=@userId";
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    sda.SelectCommand.Parameters.AddWithValue("@userId", userId);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridViewPostedJobs.DataSource = dt;
                        GridViewPostedJobs.DataBind();
                    }
                    else
                    {
                        lblDebug.Text = "No Job Have Been Posted Yet";
                    }
                }
            }
            catch (Exception ex)
            {
                lblDebug.Text = "Error: " + ex.Message;
            }
        }

        private void LoadJobInterestRequests()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT ji.JobId, j.Title AS JobTitle, e.Name AS EmployeeName, e.EmailId AS EmployeeEmail, ji.Status " +
                               "FROM JobInterest ji " +
                               "JOIN job j ON ji.JobId = j.Id " +
                               "JOIN employee e ON ji.EmployeeId = e.userid " +
                               "WHERE j.employer_id = @EmployerId"; // Replace with your actual logic for EmployerId
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmployerId", Session["userid"].ToString()); // Assuming you store employer ID in session
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvJobInterestRequests.DataSource = dt;
                gvJobInterestRequests.DataBind();
            }
        }

        protected void gvJobInterestRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Verify" || e.CommandName == "Reject")
            {
                // Get the JobId from CommandArgument
                int jobId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Verify")
                {
                    VerifyJobInterest(jobId);
                }
                else if (e.CommandName == "Reject")
                {
                    RejectJobInterest(jobId);
                }
            }
        }

        private void VerifyJobInterest(int jobId)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "UPDATE JobInterest SET Status = 'Verified' WHERE JobId = @JobId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@JobId", jobId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            LoadJobInterestRequests(); // Refresh the GridView
        }

        private void RejectJobInterest(int jobId)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "UPDATE JobInterest SET Status = 'Rejected' WHERE JobId = @JobId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@JobId", jobId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            LoadJobInterestRequests();
        }


        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            // Redirect to job posting page
            Response.Redirect("PostJob.aspx");
        }
    }
}
