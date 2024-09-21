<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="SkillSage.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" BorderStyle="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="GridImage" Height="150" Width="150" ImageUrl='<%# Eval("image_name") %>' runat="server" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <h1>Personal Details</h1>

    <h2>Basic Information</h2>
    <table class="details-table">
        <tr>
            <td>
                <label>Name:</label></td>
            <td>
                <asp:Label ID="NameLabel" runat="server" Text="John Doe"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <label>Gender:</label></td>
            <td>
                <asp:Label ID="GenderLabel" runat="server" Text="01 Jan 1990"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <label>User Id:</label></td>
            <td>
                <asp:Label ID="UserIdLabel" runat="server" Text="1234 Street, City, Country"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <label>Email:</label></td>
            <td>
                <asp:Label ID="EmailLabel" runat="server" Text="johndoe@example.com"></asp:Label></td>
        </tr>
    </table>

    <h2>Uploaded Documents</h2>
    <div class="upload-section">
        <label for="FileUpload1">Upload Your Image:</label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
    </div>



    <div class="button-container">
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="UPDATE" CssClass="aspNetButton" Visible="False" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SAVE" CssClass="aspNetButton" />
        <br />
        <br />
    </div>
</asp:Content>
