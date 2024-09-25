<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="EmployerDashboard.aspx.cs" Inherits="SkillSage.EmployerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employer Dashboard</title>
    <link href="/CSS/employerDashboard.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Welcome,
    <asp:Label ID="lblEmployerName" runat="server"></asp:Label>
    </h2>

    <asp:Label ID="Message" runat="server" Text="" ForeColor="Red" CssClass="message-label" />

    <!-- Employer Details Section -->
    <h3>Employer Details</h3>
    <table class="details-table">
        <tr>
            <td><strong>Name:</strong></td>
            <td>
                <asp:Label ID="lblEmployerNameDetail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td>
                <asp:Label ID="lblEmployerEmail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><strong>Role:</strong></td>
            <td>
                <asp:Label ID="lblEmployerRole" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <!-- Company Details Section -->
    <h3>Company Details</h3>
    <table class="details-table">
        <tr>
            <td><strong>Company Name:</strong></td>
            <td>
                <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><strong>Location:</strong></td>
            <td>
                <asp:Label ID="lblCompanyLocation" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><strong>Industry:</strong></td>
            <td>
                <asp:Label ID="lblCompanyIndustry" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <!-- Post a Job Section -->
    <asp:Button ID="btnPostJob" runat="server" Text="Post a Job" CssClass="btn btn-primary" OnClick="btnPostJob_Click" />

    <!-- GridView to Show Posted Jobs (if any) -->
    <h3>Your Posted Jobs</h3>
    <asp:Label ID="lblDebug" runat="server" ForeColor="Red"></asp:Label>
    <asp:GridView ID="GridViewPostedJobs" runat="server" AutoGenerateColumns="False" CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Job ID" SortExpression="Id" />
            <asp:BoundField DataField="title" HeaderText="Job Title" SortExpression="title" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="skills" HeaderText="Skills" SortExpression="skills" />
            <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
            <asp:BoundField DataField="payment" HeaderText="Payment" SortExpression="payment" />
        </Columns>
    </asp:GridView>

    <h3>Job Interest Requests</h3>

    <asp:GridView ID="gvJobInterestRequests" runat="server" AutoGenerateColumns="False" DataKeyNames="JobId" OnRowCommand="gvJobInterestRequests_RowCommand">
        <Columns>
            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
            <asp:BoundField DataField="EmployeeEmail" HeaderText="Employee Email" />
            <asp:BoundField DataField="JobId" HeaderText="Job ID" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnVerify" runat="server" Text="Verify" CommandName="Verify" CommandArgument='<%# Eval("JobId") %>' />
                    <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("JobId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
</asp:Content>
