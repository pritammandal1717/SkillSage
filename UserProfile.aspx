<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="SkillSage.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>YOUR INFORMATION</h2>
        <table cellpadding="3" cellspacing="3" class="auto-style1">
            <tr>
                <td class="auto-style2">NAME :</td>
                <td>
                    <asp:TextBox ID="NameText" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="NameText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">EMAIL-ID :</td>
                <td>
                    <asp:TextBox ID="EmailText" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="EmailText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="EmailText" Display="Dynamic" ErrorMessage="Enter Valid Email " ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">GENDER :</td>
                <td>
                    <asp:DropDownList ID="GenderDrop" runat="server">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="Select Gender" ID="RequiredFieldValidator3" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="GenderDrop" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">USER ID : </td>
                <td>
                    <asp:TextBox ID="UserIdText" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="UserIdText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">ROLE : </td>
                <td>
                    <asp:TextBox ID="RoleText" runat="server" Width="186px" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="RoleText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">PASSWORD : </td>
                <td>
                    <asp:TextBox ID="PasswordText" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="PasswordText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">CONFIRM PASSWORD : </td>
                <td>
                    <asp:TextBox ID="ConfirmPasswordText" runat="server" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="RequiredFieldValidator" runat="server" ControlToValidate="ConfirmPasswordText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" CssClass="RequiredFieldValidator" runat="server" ControlToCompare="PasswordText" ControlToValidate="ConfirmPasswordText" Display="Dynamic" ErrorMessage="Give Same Password" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="SAVE" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
