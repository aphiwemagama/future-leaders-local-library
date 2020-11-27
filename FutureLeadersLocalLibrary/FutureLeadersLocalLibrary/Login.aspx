<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FutureLeadersLocalLibrary.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Leaders | Log In</title>
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
        <a class="navbar-brand" href="Login.aspx"><img src="img/logo.png" alt="Logo" height="30"/></a>
    </nav>
    <div style="height: 90vh">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-lg-4 my-auto">
                    <div class="row pt-3">
                        <div class="col-lg-12">
                            <div class="card border-0">
                                <img src="img/watermark.png" class="card-img-top"/>
                                <div class="card-body">
                                    <div class="card-title text-center">
                                        Log In to Future Leaders
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="LoginFrm" runat="server">
                                <div class="card">
                                    
                                    <div class="card-body">
                                        
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" Width="100%"/>  
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" Width="100%"/>
                                            </div>
                                        </div>
                                        <div class="row pt-4">
                                            <div class="col-lg-12">
                                                <asp:Button ID="btnSignin"  runat="server" class="btn btn-primary" Text="Sign In" Width="100%" OnClick="Signin_Member"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    Don't have an account? <a href="Registration.aspx">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="col-lg-12">
                            <asp:Label ID="lblLoginErrorNotification" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
