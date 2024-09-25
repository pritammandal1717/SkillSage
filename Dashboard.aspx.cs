using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Reflection.Emit;

namespace SkillSage
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    name.Text = Session["name"].ToString();
                    LoadJobInterestStatus();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }

            // Attach the RowDataBound event to the GridView
            gvJobInterestStatus.RowDataBound += new GridViewRowEventHandler(gvJobInterestStatus_RowDataBound);
        }

        private void LoadJobInterestStatus()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    // Modified query to include employer details
                    string query = @"SELECT j.title AS JobTitle, ji.Status, e.name AS EmployerName, e.emailid AS EmployerEmail
                                     FROM JobInterest ji
                                     INNER JOIN Job j ON ji.JobId = j.Id
                                     INNER JOIN employer e ON j.employer_id = e.userid
                                     WHERE ji.EmployeeId = @EmployeeId";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EmployeeId", Session["userid"].ToString());

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    gvJobInterestStatus.DataSource = dt;
                    gvJobInterestStatus.DataBind();

                    if (dt.Rows.Count == 0)
                    {
                        lblStatusMessage.Text = "You have no job interests at the moment.";
                    }
                    else
                    {
                        lblStatusMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatusMessage.Text = "Error: " + ex.Message;
            }
        }

        // RowDataBound event to handle the background coloring of status
        protected void gvJobInterestStatus_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the Status value from the current row
                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();

                // Check the status and apply background color accordingly
                if (status == "Pending")
                {
                    e.Row.BackColor = Color.Red;
                    e.Row.ForeColor = Color.Red;// Set the row background color to red for Pending
                }
                else if (status == "Verified")
                {
                    e.Row.BackColor = Color.LightGreen; // Set the row background color to green for Verified
                }
            }
        }

        protected void session_back(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
