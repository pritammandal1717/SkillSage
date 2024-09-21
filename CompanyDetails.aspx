<%@ Page Title="" Language="C#" MasterPageFile="~/AuthPage.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="SkillSage.CompanyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/signup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container-fluid">
            <div class="signup" style="width: 70%; margin-top: 3rem;">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="SubmitButton">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CompanyName">Company Name</label>
                                <asp:TextBox class="form-control" ID="CompanyName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorName" runat="server" ControlToValidate="CompanyName" Display="Dynamic" ErrorMessage="Please Enter the Company Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyEIN">EIN</label>
                                <asp:TextBox class="form-control" ID="CompanyEIN" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorEIN" runat="server" ControlToValidate="CompanyEIN" Display="Dynamic" ErrorMessage="Please Enter the EIN" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyAddress">Address</label>
                                <asp:TextBox class="form-control" ID="CompanyAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="CompanyAddress" Display="Dynamic" ErrorMessage="Please Enter the Address" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyLogo">Logo</label>
                                <div class="custom-file">
                                    <asp:FileUpload ID="CompanyLogo" class="custom-file-input" runat="server" OnChange="showImagePreview(this)" />
                                    <label class="custom-file-label" for="CompanyLogo">Choose file</label>
                                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                </div>
                                <img id="imagePreview" class="image-preview" />
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidator7" runat="server" ControlToValidate="CompanyLogo" Display="Dynamic" ErrorMessage="Please Choose a Profile Picture" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyURL">Website URL</label>
                                <asp:TextBox class="form-control" ID="CompanyURL" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorURL" runat="server" ControlToValidate="CompanyURL" Display="Dynamic" ErrorMessage="Please Enter the Website URL" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="CompanyStructure">Company Structure</label>
                                <asp:TextBox class="form-control" ID="CompanyStructure" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorStructure" runat="server" ControlToValidate="CompanyStructure" Display="Dynamic" ErrorMessage="Please Enter the Company Structure" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanySector">Sector</label>
                                <asp:TextBox class="form-control" ID="CompanySector" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorSector" runat="server" ControlToValidate="CompanySector" Display="Dynamic" ErrorMessage="Please Enter the Sector" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyDescription">Description</label>
                                <asp:TextBox class="form-control" ID="CompanyDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorDescription" runat="server" ControlToValidate="CompanyDescription" Display="Dynamic" ErrorMessage="Please Enter the Description" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="CompanyPolicy">Company Policy</label>
                                <asp:TextBox class="form-control" ID="CompanyPolicy" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator class="error-message" ID="RequiredFieldValidatorPolicy" runat="server" ControlToValidate="CompanyPolicy" Display="Dynamic" ErrorMessage="Please Enter the Policy" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end mt-3">
                            <asp:Button class="btn btn-primary" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <script>
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
        document.getElementById('<%= CompanyLogo.ClientID %>').addEventListener('change', function () {
            showImagePreview(this);
        });
    </script>
</asp:Content>
