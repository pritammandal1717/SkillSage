<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SkillSage.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/dashboard.css" rel="stylesheet" />
    <div class="dashboard-container">
        <div class="sidebar">
            <a href="Dashboard.aspx">Home</a>
            <a href="UserDetails.aspx">Details</a>
            <a href="UserProfile.aspx">Profile</a>
            <a href="ViewJobs.aspx">Available Jobs</a>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="session_back" CssClass="LinkButton">Log Out</asp:LinkButton>
        </div>
        <div class="content">
            <div class="welcome-message">
                <h1>HELLO
                    <asp:Label ID="name" runat="server"></asp:Label>, WELCOME TO THE DASHBOARD</h1>
            </div>
            <div class="grid-container">
                <h2>Your Interest Status</h2>
                <asp:GridView ID="gvJobInterestStatus" runat="server" AutoGenerateColumns="False" GridLines="None" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                        <asp:BoundField DataField="EmployerName" HeaderText="Employer Name" />
                        <asp:BoundField DataField="EmployerEmail" HeaderText="Contact Details" />
                        <asp:BoundField DataField="Status" HeaderText="Interest Status" />
                    </Columns>
                </asp:GridView>

                <!-- Label to show messages if needed -->
                <asp:Label ID="lblStatusMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
