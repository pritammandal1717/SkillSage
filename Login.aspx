<%@ Page Title="" Language="C#" MasterPageFile="~/AuthPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SkillSage.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link href="/CSS/login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container-fluid">
            <div class="login">
                <asp:Label class="form-text" ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-group">
                    <label for="exampleInputEmail1">Email </label>
                    <asp:TextBox class="form-control text-box" ID="UserEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserEmail" Display="Dynamic" ErrorMessage="Please Enter Your Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <asp:TextBox class="form-control text-box" ID="PasswordText" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordText" Display="Dynamic" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="showPasswordCheckbox" onchange="togglePasswordVisibility()" />
                    <label for="showPasswordCheckbox">Show Password</label>
                </div>
                <div class="d-flex flex-column align-items-end mt-3">
                    <asp:Button class="btn" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                    <a href="SignUp.aspx" class="btn" role="button" aria-pressed="true">Not Yet Registered? Register Now</a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= PasswordText.ClientID %>');
            var checkbox = document.getElementById('showPasswordCheckbox');
            passwordField.type = checkbox.checked ? 'text' : 'password';
        }
        window.onload = function () {
            var checkbox = document.getElementById('showPasswordCheckbox');
            checkbox.checked = false;
            var passwordField = document.getElementById('<%= PasswordText.ClientID %>');
            passwordField.type = 'password';
            checkbox.addEventListener('change', togglePasswordVisibility);
        }
    </script>
</asp:Content>
