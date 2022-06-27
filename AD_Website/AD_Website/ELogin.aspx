<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ELogin.aspx.cs" Inherits="AD_Website.ELogin" %>

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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css"/>
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
                    <li>
                        <a href="Login.aspx">Login</a>
                    </li>
                    <li>
                        <a href="ELogin.aspx">Employee</a>
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

         .options2
         {
             background: #fff;
             border-radius: 2px;
             display: inline-block;
             height: 300px;
             margin: 1rem;
             
             position:absolute;
             width: 600px;
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
            margin-bottom: 20px;
            position:absolute;
            display:inline;
            left:38%;
            padding: 30px 50px;
            text-align: right;
            background: #fff;
            background: rgba(255,255,255,0.9);
        }

     </style>
     <div class="container">
        <div class="row">
            <div class="box">
                    <h2 style="text-align:center">Employee Options</h2>
                    <hr />
                <div class="options" style="text-align:center">
                    <h4><u>Hardware Info </u></h4>
                    <p><asp:Button ID="addRentals" runat="server" Text="Make Rental" class="btn-8" OnClick="addRentals_Click" /> </p>
                    <p><asp:Button ID="ViewMaintenance" runat="server" Text="View Schedule" class="btn-8" OnClick="ViewMaintenance_Click" /></p>
                    <p><asp:Button ID="UpdateSchedule" runat="server" Text="Update List" class="btn-8" OnClick="UpdateSchedule_Click"/></p>
                    <%--<p><asp:Button ID="upStatus" runat="server" Text="Update Status" class="btn-8"/> </p>--%>
                </div>
                <div class="options2" style="text-align:center" >
                    <h2>
                        <asp:Label ID="Selection" runat="server" Text="Selection" Visible ="false"></asp:Label></h2>
                    <hr />
                    <asp:Label ID="newDate" runat="server" Text="Label" Visible="false"></asp:Label>
                    &nbsp;<asp:TextBox ID="text_newdate" runat="server" Visible="false"></asp:TextBox>

                    &nbsp;<asp:Label ID="endDate" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:TextBox ID="text_enddate" runat="server" Visible="false"></asp:TextBox>
                    <br /><br />
                    <asp:Label ID="hardware" runat="server" Text="Label" Visible="false"></asp:Label>
                    &nbsp;<asp:DropDownList ID="ddl_hdware" runat="server" Visible="false" Height="29px" Width="120px"></asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="emp" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddl_emp" runat="server" Visible="false" Height="29px" Width="120px"></asp:DropDownList>
                    <br /><br />
                    <asp:Button ID="submit" runat="server" Text="Submit" class="btn-primary" Height="30px" Width="100px" Visible="false" OnClick="submit_Click"/>
                    <br /><br />
                    <asp:Label ID="status" runat="server" Text="" Visible="false"></asp:Label>
                </div>
            </div>
          </div>
        <div class="row">
            <div class="box">
                    <asp:GridView ID="empOGrid" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="673px" HorizontalAlign="Center" Height="152px" Visible="true">
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