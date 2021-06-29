<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication1.WebForm4" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
    div {text-align: center;}
    </style>
</head>
<body>
        <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href=""><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>


    <asp:FileUpload ID="Fileup1" runat="server" /><asp:Button ID="btnup" onclick="btnup_click"  runat="server" Text="upload" />

            <asp:DataList ID="DataList1" runat="server" RepeatColumns="6" CellPadding="4" ForeColor="#333333">
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EFF3FB" />
                <ItemTemplate>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="196px" BorderWidth="2px" ImageUrl='<%# Eval("path") %>' Width="234px" />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("path") %>' OnCommand="LinkButton1_Command">Delete</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("name") %>' OnCommand="LinkButton2_Command" CommandName = "Download" >Download</asp:LinkButton>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataList>
        </form>

</body>
</html>
