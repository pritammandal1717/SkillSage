<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SkillSage.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome Admin</title>
    <link href="/CSS/adminDashboard.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin Dashboard</h2>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="gridview">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
            <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skillsage %>" DeleteCommand="DELETE FROM [employee] WHERE [Id] = @Id" InsertCommand="INSERT INTO [employee] ([name], [emailid], [gender], [role], [password]) VALUES (@name, @emailid, @gender, @role, @password)" SelectCommand="SELECT * FROM [employee]" UpdateCommand="UPDATE [employee] SET [name] = @name, [emailid] = @emailid, [gender] = @gender, [role] = @role, [password] = @password WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="emailid" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="emailid" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Employer Sign-Up Requests</h3>
    <asp:GridView ID="GridViewEmployer" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataKeyNames="Id" DataSourceID="SqlDataSourceEmployer" CssClass="gridview"
        OnRowCommand="GridViewEmployer_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnVerify" runat="server" Text="Verify" CommandName="Verify" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-success" />
                    <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="emailid" HeaderText="Email" SortExpression="emailid" />
            <asp:BoundField DataField="emprole" HeaderText="Employer Role" SortExpression="emprole" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
            <asp:BoundField DataField="isVerified" HeaderText="Verified" SortExpression="isVerified" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceEmployer" runat="server"
        ConnectionString="<%$ ConnectionStrings:skillsage %>"
        SelectCommand="SELECT * FROM [employer] WHERE [isVerified] = 0"
        UpdateCommand="UPDATE [employer] SET [isVerified] = 1 WHERE [Id] = @Id"
        DeleteCommand="DELETE FROM [employer] WHERE [Id] = @Id">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
