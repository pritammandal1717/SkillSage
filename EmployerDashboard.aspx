<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="EmployerDashboard.aspx.cs" Inherits="SkillSage.EmployerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Employer Dashboard</title>
    <link href="/CSS/employerDashboard.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Welcome,
    <asp:Label ID="lblEmployerName" runat="server"></asp:Label>
    </h2>

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

</asp:Content>
