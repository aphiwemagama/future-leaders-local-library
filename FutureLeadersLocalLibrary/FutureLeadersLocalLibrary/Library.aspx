<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Library.aspx.cs" Inherits="FutureLeadersLocalLibrary.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Leaders | Library</title>
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
    <!-- Demo header-->
    <section class="py-5 header">
        <div class="container py-4">
            <div class="row">
                <div class="col-md-3">
                    <!-- Tabs nav -->
                    <div class="nav flex-column nav-pills nav-pills-custom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link mb-3 p-3 shadow active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                            <i class="fa fa-user-circle-o mr-2"></i>
                            <span class="font-weight-bold small text-uppercase">Resources</span>
                        </a>
                        
                        <a class="nav-link mb-3 p-3 shadow" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <i class="fa fa-star mr-2"></i>
                            <span class="font-weight-bold small text-uppercase">Add Resource</span>
                        </a>
                        
                    </div>
                </div>
                <div class="col-md-9">
                    <!-- Tabs content -->
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade shadow rounded bg-white show active p-5" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <h4 class="mb-4">Resource Listing</h4>
                                    
                                    <asp:Repeater ID="tblRepeater" runat="server">
                                        <HeaderTemplate>
                                            <div class="row">
                                            
                                                
                                            
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="col-lg-4">
                                            <div class="card">
                                                <img src="<%#Eval("Artwork")%>" class="card-img-top"/>
                                                <div class="card-body">
                                                    <h5 class="card-title"><%#Eval("Title")%></h5>
                                                    <h6 class="card-subtitle mb-2 text-muted"><%#Eval("Author")%></h6>
                                                    <a href="Resource.aspx?resourceID=<%#Eval("Id")%>&sessionID=<%=Session["memberLogin"]%>" class="card-link">More</a>
                                                </div>
                                            </div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            
                                                
                                            
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                
                            
                                
                            
                        </div>
                        <div class="tab-pane fade shadow rounded bg-white p-5" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            
                        </div>
                        <div class="tab-pane fade shadow rounded bg-white p-5" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <h4 class="mb-4">Add an Item</h4>
                            
                                <form id="AddResourceFrm" runat="server">

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldTitle" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtTitle" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="txtTitle" runat="server" class="form-control" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldAuthor" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtAuthor" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label2" runat="server" Text="Author"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="txtAuthor" runat="server" class="form-control" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldEdition" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtEdition" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label3" runat="server" Text="Edition"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="txtEdition" runat="server" class="form-control" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldPublisher" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtPublisher" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label5" runat="server" Text="Publisher"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="txtPublisher" runat="server" class="form-control" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldPublish" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="fuArtwork" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label4" runat="server" Text="Artwork"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:FileUpload ID="fuArtwork" runat="server" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldISBN" runat="server" ErrorMessage="Please fill out this field." ControlToValidate="txtISBN" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:Label ID="Label6" runat="server" Text="ISBN"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="txtISBN" runat="server" class="form-control" Width="100%"/>  
                                                </div>
                                            </div>

                                            
                                        </div>
                                    </div>

                                    <div class="row pt-4">
                                        <div class="col-lg-12">
                                            <asp:Button ID="btnAddResource"  runat="server" class="btn btn-primary" Text="Add Resource" OnClick="Add_Item"/>
                                        </div>
                                    </div>
                                    <div class="row pt-3">
                                        <div class="col-lg-12">
                                            <asp:Label ID="lblAddResErrorNotification" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </form>
                            
                        </div>
                        <div class="tab-pane fade shadow rounded bg-white p-5" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
