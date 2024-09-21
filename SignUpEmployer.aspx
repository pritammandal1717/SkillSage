<%@ Page Title="" Language="C#" MasterPageFile="~/AuthPage.Master" AutoEventWireup="true" CodeBehind="SignUpEmployer.aspx.cs" Inherits="SkillSage.SignUpEmployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register Here</title>
    <link href="/CSS/signup.css" rel="stylesheet" type="text/css" />
    <style>
        .form-group {
            margin-bottom: 2rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container-fluid">
            <div class="signup" style="width: 70%; margin-top: 3rem;">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">UserName</label>
                            <asp:TextBox class="form-control" ID="UserId" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserId" Display="Dynamic" ErrorMessage="Please Enter a UserName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Name</label>
                            <asp:TextBox class="form-control" ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" Display="Dynamic" ErrorMessage="Please Enter Your Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <asp:TextBox class="form-control" ID="UserEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserEmail" Display="Dynamic" ErrorMessage="Please Enter Your Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator class="error-message" ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserEmail" Display="Dynamic" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label aria-label="Default select example">Role</label>
                            <asp:DropDownList class="form-select" ID="UserRole" runat="server">
                                <asp:ListItem class="select" Value="recruiter">Recruiter</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserRole" Display="Dynamic" ErrorMessage="Please Enter Your Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="UserImage">Profile Picture</label>
                            <div class="custom-file">
                                <asp:FileUpload ID="UserImage" class="custom-file-input" runat="server" OnChange="showImagePreview(this)" />
                                <label class="custom-file-label" for="UserImage">Choose file</label>
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                            <img id="imagePreview" class="image-preview" />
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator7" runat="server" ControlToValidate="UserImage" Display="Dynamic" ErrorMessage="Please Choose a Profile Picture" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <asp:TextBox class="form-control" ID="UserPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator5" runat="server" ControlToValidate="UserPassword" Display="Dynamic" ErrorMessage="Please Enter A Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2">Confirmation Password</label>
                            <asp:TextBox class="form-control" ID="UserConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator6" runat="server" ControlToValidate="UserConfirmPassword" Display="Dynamic" ErrorMessage="Please Re-Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator class="error-message" ID="CompareValidator1" runat="server" ControlToCompare="UserPassword" ControlToValidate="UserConfirmPassword" Display="Dynamic" ErrorMessage="Password Didn't Matched" ForeColor="Red"></asp:CompareValidator>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" id="showPasswordCheckbox" onchange="togglePasswordVisibility()" />
                            <label for="showPasswordCheckbox">Show Password</label>
                        </div>
                        <div class="d-flex justify-content-end mt-3" style="margin-top: 0px;">
                            <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= UserPassword.ClientID %>');
            var checkbox = document.getElementById('showPasswordCheckbox');
            passwordField.type = checkbox.checked ? 'text' : 'password';
        }
        window.onload = function () {
            var checkbox = document.getElementById('showPasswordCheckbox');
            checkbox.checked = false;
            var passwordField = document.getElementById('<%= UserPassword.ClientID %>');
            passwordField.type = 'password';
            checkbox.addEventListener('change', togglePasswordVisibility);
        }
        function showImagePreview(input) {
            var preview = document.getElementById('imagePreview');
            var file = input.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
            }
        }
        document.getElementById('<%= UserImage.ClientID %>').addEventListener('change', function () {
            showImagePreview(this);
        });

    </script>
</asp:Content>
