<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rental.aspx.cs" Inherits="AD_Website.Rental1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BMGS</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form2" runat="server">
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

                    <li>
                        <a href="Login.aspx">Login</a>
                    </li>
                    <li>
                        <a href="Rental.aspx">Rental</a>
                    </li>

                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
         <style>
         .options
         {
             background: #fff;
             border-radius: 2px;
             display: inline-block;
             height: 300px;
             margin: 1rem;
             position:relative;
             width: 300px;
             box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
         }

        .btn-8 {
          background: #f2f2f2;
          border: 2px solid #000;
          transition: all 0.3s ease;
          font-size:medium;
        }
        .btn-8:before {
          position: relative;
          content: " ";
          z-index: -1;
          width: 25%;
          top: 50%;
          left: -10%;
          height: 2px;
          background: #000;
          transition: all 0.3s ease;
        }
        .btn-8:hover {
          background: #000;
          color: #fff;
          border-color: transparent;
          padding-left: 25px;
          padding-right: 25px;
        }
        .btn-8:hover:before {
            left: -15%;
        }

        .enter 
        {
            position:absolute;
            display:inline;
            left:33%;
            margin-top:.7%;
            padding: 30px 120px;
            text-align: right;
            background: #fff;
            background: rgba(255,255,255,0.9);
        }

     </style>
     <div class="container">
        <div class="row">
            <div class="box">
                    <h2 style ="text-align:center">Rental Options</h2>
                    <hr />
            </div>
            <div class="options text-center"><br /><br />
                <p><asp:Button ID="createRent" runat="server" Text="Assign Device" class="btn-8" OnClick="createRent_Click" /></p>
                <p><asp:Button ID="viewRent" runat="server" Text="View Rentals" class="btn-8" OnClick="viewRent_Click" /></p>
                <p><asp:Button ID="viewComp" runat="server" Text="Computer Info" class="btn-8" OnClick="viewComp_Click"/></p>
                <p><asp:Button ID="calcCost" runat="server" Text="Calculate Cost" class="btn-8" OnClick="calcCost_Click"/> </p>
                <p><asp:Button ID="upStatus" runat="server" Text="Update Status" class="btn-8" OnClick="upStatus_Click"/> </p>
                <p><asp:Button ID="modVal" runat="server" Text="Update Value" class="btn-8" OnClick="modVal_Click"/> </p>

            </div>
            <div class="enter">
                <h2 style = "text-align:center">
                    <asp:Label ID="rentSelect" runat="server" Text=""></asp:Label></h2>
                <hr/><br />
                <div style="text-align:left; width: 607px;">
                    <asp:Label ID="Label1" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:DropDownList ID="compID" runat="server" Height="28px"  Width="122px" AutoPostBack="true" Visible="false">
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:TextBox ID="compValue" runat="server" AutoPostBack ="true" Visible ="false"  style="text-align:center" Width="123px"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="uservalid" runat ="server" ForeColor="Red" ErrorMessage="*Username Required" ControlToValidate ="Textbox1"></asp:RequiredFieldValidator>--%>
                    <br /><br />
                    <asp:Label ID="Label4" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:DropDownList ID="compID2" runat="server" Height="28px"  Width="122px" AutoPostBack="true" Visible="false"></asp:DropDownList>&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:TextBox ID="compValue2" runat="server" AutoPostBack ="true" Visible ="false"  style="text-align:center" Width="123px"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:TextBox ID="compValue3" runat="server" AutoPostBack ="true" TextMode ="Email" Visible ="false"  style="text-align:center" Width="123px"></asp:TextBox>
                    <br /> <br />
                     <asp:Label ID="Label3" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible ="false"></asp:Label>
                    <asp:TextBox ID="hrs" runat="server"  TextMode="Number" Width="47px" Visible="false"></asp:TextBox>&nbsp;&nbsp;<asp:DropDownList ID="compID3" runat="server" Height="28px"  Width="122px" AutoPostBack="true" Visible="false"></asp:DropDownList>&nbsp;&nbsp;
                    <asp:Label ID="Total" runat="server" Text="Total: $" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                    <asp:Label ID="Price" runat="server" Text="" Font-Size="Medium" Font-Bold="true" Visible="false"></asp:Label>
                     <br /><br />
                    <center><asp:Button ID="submit" runat="server" Text="Submit" class="btn-primary" Height="30px" Width="100px" Visible ="false" OnClick="submit_Click"/></center>
                </div> <%--column--%>
             </div> <%--enter--%>
            
            <div class="box" style="margin-top:5%">
                    <h2 style ="text-align:center"><asp:Label ID="viewTable" runat="server" Text=""></asp:Label>
                        </h2>
                    <hr />
                <asp:GridView ID="HardwareView" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="673px" HorizontalAlign="Center" Height="152px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>
        </div>
      </div>
    </form>
</body>
</html>
