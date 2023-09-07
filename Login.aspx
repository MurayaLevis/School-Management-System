<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ZAWADI SCHOOL MANAGEMENT SYSTEM</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style>
        .Login
        .Image{
            min-height: 200vh;
        }

        .bg-Image{
            background-image:url(../Images/education-management-1.jpg);
            background-size:cover;
            /*background-position:center center;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row no-gutter">
                <!--The Image half-->
                <div class="col-md-6 d-none d-md-flex bg-Image"></div>

                <!-- The Content half -->
                <div class="col-md-6 bg-light">
                    <div class="Login d-flex align-items-center py-5">
               <!--Demo Content-->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-14 col-xl-7 mx-auto">
                            <h3 class="display-4 pb-3">Sign In</h3>
                            <p class ="text-bg-danger text-muted mb-5">ZAWADI DATA MANAGEMENT SYSTEM</p>

                            <p class="text-bg-danger text-muted mb-4">Login Page for Admin & Teacher.</p>

                            <div class="form-group mb-3">
                                <input id="inputEmail" type="text" placeholder="Email Address" required="" runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" />
                            </div>

                            <div class="form-group mb-3 mb-2">
                                <input id="InputPassword" type="password" placeholder="Password" required="" runat="server" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" />
                            </div>

                            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558C9" OnClick="btnLogin_Click" />
                            <div class="text-center d-flex justify-content-between mt-4">
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End-->

            </div>
        </div>

         <!--End-->
       </div>
      </div>
    </form>
</body>
</html>
