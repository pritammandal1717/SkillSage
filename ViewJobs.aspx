<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="ViewJobs.aspx.cs" Inherits="SkillSage.ViewJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" >
        .job-card {
            background-color: white;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            height: 350px; /* Fixed height */
            max-width: 300px; /* Fixed width */
            overflow: hidden; /* Hide overflow content */
            display: flex;
            flex-direction: column; /* Ensure content stacks vertically */
            justify-content: space-between; /* Evenly space content */
        }

        .job-card:hover {
            transform: translateY(-5px);
        }

        .job-card h3 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 15px;
            overflow: hidden; /* Hide overflowing text */
            text-overflow: ellipsis; /* Show "..." for truncated text */
            white-space: nowrap; /* Ensure text does not wrap */
        }

        .job-card p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 10px;
            overflow: hidden; /* Hide overflowing text */
            text-overflow: ellipsis; /* Show "..." for truncated text */
            white-space: nowrap; /* Prevent text wrapping */
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            text-transform: uppercase;
            font-size: 0.875rem;
            transition: background-color 0.3s;
            align-self: flex-end; /* Align button at the bottom */
        }

            .btn:hover {
                background-color: #0056b3;
            }

        .message-container {
            display: flex; /* Use flexbox for positioning */
            justify-content: flex-end; /* Align to the right */
            margin-bottom: 20px; /* Add some space below the message */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <!-- Message at the top right corner -->
        <div class="message-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert" Visible="false" />
        </div>

        <h2 class="mb-4 text-center">Available Jobs</h2>

        <!-- Responsive job listing -->
        <div class="row">
            <asp:Repeater ID="rptJobs" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4 d-flex justify-content-center">
                        <div class="card job-card">
                            <div class="card-body">
                                <h3 class="card-title"><%# Eval("title") %></h3>
                                <p class="card-text"><strong>Description:</strong> <%# Eval("description") %></p>
                                <p class="card-text"><strong>Skills:</strong> <%# Eval("skills") %></p>
                                <p class="card-text"><strong>Duration:</strong> <%# Eval("duration") %></p>
                                <p class="card-text"><strong>Payment:</strong> $<%# Eval("payment") %></p>
                                <p class="card-text"><strong>Company Name:</strong> <%# Eval("company_name") %></p>
                                <asp:Button ID="btnShowInterest" runat="server" Text="Show Interest"
                                    CommandArgument='<%# Eval("Id") + "," + Eval("employer_id") %>'
                                    OnClick="btnShowInterest_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</asp:Content>
