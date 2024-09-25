using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace SkillSage
{
    public partial class ViewJobs : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobs();
                lblMessage.Visible = false;

            }
        }

        private void LoadJobs()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Updated query to join 'job' and 'company' tables to fetch job and company details
                string query = @"
                    SELECT job.Id, job.title, job.description, job.skills, job.duration, 
                           job.payment, job.employer_id, company.name AS company_name
                    FROM job
                    INNER JOIN company ON job.employer_id = company.user_id";

                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                rptJobs.DataSource = dt;
                rptJobs.DataBind();
            }
        }

        protected void btnShowInterest_Click(object sender, EventArgs e)
        {
            // Button click event to handle the interest shown by an employee
            Button btn = (Button)sender;
            string[] arguments = btn.CommandArgument.Split(',');
            string jobId = arguments[0];  // Job ID as a string
            string employerId = arguments[1];  // Employer ID as a string

            if (Session["userid"] != null)
            {
                string employeeId = Session["userid"].ToString();  // Get Employee ID from session

                using (SqlConnection con = new SqlConnection(cs))
                {
                    // Check if the employee has already shown interest in the selected job
                    string checkQuery = "SELECT COUNT(*) FROM JobInterest WHERE JobId = @JobId AND EmployeeId = @EmployeeId";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@JobId", jobId);
                    checkCmd.Parameters.AddWithValue("@EmployeeId", employeeId);

                    con.Open();
                    int interestCount = (int)checkCmd.ExecuteScalar();
                    con.Close();

                    if (interestCount > 0)
                    {
                        lblMessage.Text = "You have already shown interest in this job!";
                        lblMessage.CssClass = "alert alert-success"; // Apply bootstrap success alert class
                        lblMessage.Visible = true;
                        return;
                    }

                    // If the employee hasn't shown interest yet, insert the new record
                    string query = "INSERT INTO JobInterest (JobId, EmployeeId, EmployerId) VALUES (@JobId, @EmployeeId, @EmployerId)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@JobId", jobId);
                    cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                    cmd.Parameters.AddWithValue("@EmployerId", employerId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblMessage.Text = "Your interest has been successfully sent!";
                    lblMessage.CssClass = "alert alert-success"; // Apply bootstrap success alert class
                    lblMessage.Visible = true; // Make label visible
                }
            }
            else
            {
                lblMessage.Text = "Please log in to show interest in this job.";
                lblMessage.CssClass = "alert alert-danger"; // Apply bootstrap danger alert class
                lblMessage.Visible = true; // Make label visible
            }
        }
    }
}
