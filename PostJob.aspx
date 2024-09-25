<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="SkillSage.PostJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post a Job</title>
    <link href="/CSS/postJob.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/jobpost.css" rel="stylesheet" />
    <div class="post-job-container">
        <h2>Post a Job</h2>
        <asp:Panel ID="panelPostJob" runat="server" CssClass="job-form-panel">
            <div class="form-group">
                <label for="txtTitle">Job Title:</label>
                <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" MaxLength="50" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtSkills">Skills Required:</label>
                <asp:TextBox ID="txtSkills" runat="server" MaxLength="50" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtDuration">Duration:</label>
                <asp:TextBox ID="txtDuration" runat="server" MaxLength="50" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtPayment">Payment:</label>
                <asp:TextBox ID="txtPayment" runat="server" MaxLength="50" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtInformation">Additional Information (Optional):</label>
                <asp:TextBox ID="txtInformation" runat="server" MaxLength="50" CssClass="form-control" TextMode="MultiLine" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnPostJob" runat="server" Text="Post Job" CssClass="btn btn-primary btn-post-job" OnClick="btnPostJob_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
