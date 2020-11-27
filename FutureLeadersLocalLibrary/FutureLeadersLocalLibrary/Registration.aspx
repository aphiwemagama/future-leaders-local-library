<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FutureLeadersLocalLibrary.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Leaders | Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>

    <style>
        body{font-family: 'Roboto', serif;}
        .navbar-custom{background-color: #f5f5f5;}
    </style>
</head>
<body>
    <nav id="navbar" class="navbar navbar-expand-lg navbar-custom sticky-top">
        <a class="navbar-brand" href="index.html"><img src="img/logo.png" alt="Logo" height="30"/></a>
    </nav>
    <div style="height: 90vh">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-lg-12 my-auto">
                    <div class="row my-auto">
                        <div class="col-lg-6 col-sm-12">
                            <h1>Future Leaders</h1>
                            <h6>Library Management System</h6>
                            <ul>
                                <li>Offer such resources - books, CDs and newsletters</li>
                                <li>Monthly subscription worth R50</li>
                                <li>Pay R100 deposit, refundable upon resource return</li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <h5>REGISTRATION</h5>
                            <form id="registerFrm" runat="server">
                                <div>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstname" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtFirstname" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:Label ID="Label1" runat="server" Text="Label">First name</asp:Label>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:Label ID="Label4" runat="server" Text="Label">Email</asp:Label>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:TextBox ID="txtFirstname" runat="server" class="form-control" Width="100%"/>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" Width="100%"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row pt-2">
                                        <div class="col-lg-6">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtLastname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="Label2" runat="server" Text="Label">Last name</asp:Label>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="Label3" runat="server" Text="Label">Password</asp:Label>
                                        </div>
                                        <div class="col-lg-6">
                                            
                                            <asp:TextBox ID="txtLastname" runat="server" class="form-control" Width="100%"/>
                                        </div>
                                        <div class="col-lg-6">
                                            
                                            <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" Width="100%"/>
                                        </div>
                                    </div>

                                    <div class="row pt-2">
                                        <div class="col-lg-6">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtLastname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-6">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="Label5" runat="server" Text="Label">Address</asp:Label>
                                        </div>
                                        <div class="col-lg-6">
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" Width="100%"/>
                                        </div>
                                        <div class="col-lg-6">
                                        </div>
                                    </div>

                                    <div class="row pt-3">
                                        <div class="col-lg-6">
                                            <asp:Button ID="btnRegister"  runat="server" class="btn btn-primary" Text="REGISTER" OnClick="Register_Member"/>
                                        </div>
                                    </div>
                                    <div class="row pt-3">
                                        <div class="col-lg-6">
                                            <p>Already have an account? <a href="Login.aspx">Log in</a></p>
                                        </div>
                                    </div>
                                    <div class="row pt-3">
                                        <div class="col-lg-12">
                                            <asp:Label ID="lblRegistrationErrorNotification" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
