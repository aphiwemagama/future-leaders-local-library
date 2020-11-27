<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resource.aspx.cs" Inherits="FutureLeadersLocalLibrary.Resource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Leaders | Resource</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>

    <style>
        body{font-family: 'Roboto', serif;}
        .navbar-custom{background-color: #f5f5f5;}
        .nav-pills-custom .nav-link {
            color: #aaa;
            background: #fff;
            position: relative;
        }
        .nav-pills-custom .nav-link.active {
            color: #45b649;
            background: #fff;
        }
        @media (min-width: 992px) {
            .nav-pills-custom .nav-link::before {
                content: '';
                display: block;
                border-top: 8px solid transparent;
                border-left: 10px solid #fff;
                border-bottom: 8px solid transparent;
                position: absolute;
                top: 50%;
                right: -10px;
                transform: translateY(-50%);
                opacity: 0;
            }
        }
        .nav-pills-custom .nav-link.active::before {
            opacity: 1;
        }
    </style>
    <script src="js/jquery/jquery.slim.min.js"></script>
    <script src="js/bootstrap/bootstrap.bundle.min.js"></script>
</head>
<body>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnection %>" SelectCommand="SELECT * FROM [membership]"></asp:SqlDataSource>
    <nav id="navbar" class="navbar navbar-expand-lg navbar-custom sticky-top">
        <a class="navbar-brand" href="Login.aspx"><img src="img/logo.png" alt="Logo" height="30"/></a>
    </nav>
    <section class="py-5">
        <div class="container">
            <h4 class="mb-4">Issue Resource</h4>
            <div class="row">
                <div class="col-lg-12">
                    <asp:Repeater ID="tblRepeater" runat="server">
                        <HeaderTemplate>
                            <div class="row">                             
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="col-lg-8">
                                <div class="card border-0">
                                    <div class="row no-gutters">
                                        <div class="col">
                                            <img src="<%#Eval("Artwork")%>" class="card-img-top"/>
                                        </div>
                                        <div class="col">
                                            <div class="card-body">
                                                <h5 class="card-title"><%#Eval("Title")%></h5>
                                                <h6 class="card-subtitle mb-2 text-muted"><%#Eval("Author")%></h6>
                                                <h6 class="card-subtitle mb-2 text-muted"><%#Eval("Edition")%></h6>
                                                <h6 class="card-subtitle mb-2 text-muted"><%#Eval("Publisher")%></h6>
                                                <h6 class="card-subtitle mb-2 text-muted"><b>ISBN 13: </b> <%#Eval("ISBN")%></h6>
                                                <form id="issueResourceFrm" runat="server">   
                                                    <asp:Button ID="btnIssueResource" runat="server" class="btn btn-primary" Text="Proceed" OnClick="Issue_Resource" />
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>                           
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="row py-4">
                <div class="col-lg-3">
                    <asp:Label ID="lblIssueResourceNotification" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
