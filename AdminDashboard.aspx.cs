﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SkillSage
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                string userRole = Session["role"].ToString(); // "admin"  or "user"

                if (userRole.Equals("admin", StringComparison.OrdinalIgnoreCase))
                {
                    SqlConnection con = new SqlConnection(cs);
                    string query = "select * from employee where role=@role";
                    SqlDataAdapter sql = new SqlDataAdapter(query, con);
                    sql.SelectCommand.Parameters.AddWithValue("@role", "user");
                    DataTable table = new DataTable();
                    sql.Fill(table); // My "table" is cosnsisting of all the data from my database (only one row)


                    GridView1.DataSourceID = null; // break up with my sqldatasource1
                    GridView1.DataSource = table; // "table" is the replacement
                    GridView1.AutoGenerateEditButton = false;
                    GridView1.AutoGenerateDeleteButton = false;
                    GridView1.DataBind(); // it will be binding my new datasource with the grid

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void GridViewEmployer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Check if the command is either Verify or Reject
            if (e.CommandName == "Verify" || e.CommandName == "Reject")
            {
                // Convert the command argument to an integer to get the employer ID
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewEmployer.Rows[index];
                int employerId = Convert.ToInt32(GridViewEmployer.DataKeys[index].Value);

                if (e.CommandName == "Verify")
                {
                    VerifyEmployer(employerId);
                }
                else if (e.CommandName == "Reject")
                {
                    RejectEmployer(employerId);
                }
            }
        }

        private void VerifyEmployer(int employerId)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "UPDATE employer SET isVerified = 1 WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", employerId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            GridViewEmployer.DataBind(); // Refresh the GridView
        }

        private void RejectEmployer(int employerId)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "DELETE FROM employer WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", employerId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            GridViewEmployer.DataBind(); // Refresh the GridView
        }

    }
}