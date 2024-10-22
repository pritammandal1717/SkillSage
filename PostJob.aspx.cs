﻿using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SkillSage
{
    public partial class PostJob : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["skillsage"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] == null || Session["role"].ToString() != "employer")
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnPostJob_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO job (employer_id, title, description, skills, duration, payment, information) " +
                                   "VALUES (@employerId, @title, @description, @skills, @duration, @payment, @information)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    // Assigning values to parameters
                    cmd.Parameters.AddWithValue("@employerId", Session["userid"].ToString());
                    cmd.Parameters.AddWithValue("@title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@skills", txtSkills.Text);
                    cmd.Parameters.AddWithValue("@duration", txtDuration.Text);
                    cmd.Parameters.AddWithValue("@payment", txtPayment.Text);
                    cmd.Parameters.AddWithValue("@information", txtInformation.Text);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        Response.Redirect("EmployerDashboard.aspx" + "?posted=10");
                    }

                    con.Close();
                }
            }
        }
    }
}
