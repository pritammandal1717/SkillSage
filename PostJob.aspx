<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="SkillSage.PostJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post a Job</title>
    <link href="/CSS/postJob.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Post a Job</h2>
    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" />

    <asp:Panel ID="panelPostJob" runat="server">
        <table>
            <tr>
                <td>Job Title:</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" MaxLength="50" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Skills Required:</td>
                <td>
                    <asp:TextBox ID="txtSkills" runat="server" MaxLength="50" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Duration:</td>
                <td>
                    <asp:TextBox ID="txtDuration" runat="server" MaxLength="50" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Payment:</td>
                <td>
                    <asp:TextBox ID="txtPayment" runat="server" MaxLength="50" CssClass="form-control" /></td>
            </tr>
            <tr>
                <td>Additional Information (Optional):</td>
                <td>
                    <asp:TextBox ID="txtInformation" runat="server" MaxLength="50" CssClass="form-control" TextMode="MultiLine" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnPostJob" runat="server" Text="Post Job" CssClass="btn btn-primary" OnClick="btnPostJob_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
