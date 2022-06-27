<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AD_Website.ALogin" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8"/>
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>BMGS</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet"/>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
    <title></title>
<body>
    <form id="form1" runat="server">
        <div class="brand">BMGS Internet Cafe</div>
    <!--<div class="address-bar">3481 Melrose Place | Beverly Hills, CA 90210 | 123.456.7890</div>-->
    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">Home</a>
                    </li>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container">
        <div class="row">
            <style>
                .enter 
                {
                    margin-bottom: 20px;
                    position:absolute;
                    left:38%;
                    padding: 30px 50px;
                    text-align: right;
                    background: #fff;
                    background: rgba(255,255,255,0.9);
                }

            </style>
            <div class="enter">
                <h2 style = "text-align:center">Login</h2>
                <hr/><br />
                <div class="col-lg-12" style="text-align:center">
                    <label id="user" style ="font-size:20px">Username: </label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="uservalid" runat ="server" ForeColor="Red" ErrorMessage="*Username Required" ControlToValidate ="Textbox1"></asp:RequiredFieldValidator>
                    &nbsp;<br /> <br />
                    <label id="pword" style ="font-size:20px">Password: </label>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passvalid" runat ="server" ForeColor="Red" ErrorMessage="*Password Required" ControlToValidate ="Textbox2"></asp:RequiredFieldValidator>
                    <br /><br />
                    <asp:Button ID="submit" runat="server" Text="Submit" class="btn-primary" Height="30px" Width="100px" OnClick="submit_Click"/>
                    <br /><br /><asp:Label ID="check" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </div> <!--column-->
             </div> <!--enter-->
        </div> <!--container-->
        </div>
    </form>
</body>
</html>

