<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="practiceapplication.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <title>Login</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <style>
      .custom-header {
          background-color: #007bff;
          color: white;
      }
      .custom-header img {
          height: 80px; 
          margin-right: 20px;
      }
  </style>
</head>
<body>
               <div class="container-fluid custom-header py-2">
    <div class="row align-items-center">
        <div class="col-auto">
            <img src="Content/logo.png" alt="Logo"/>

        </div>
        <div class="col text-center">
            <h3 class="m-0">Message Processing System</h3>
        </div>
        <div class="col-auto"></div>
    </div>
</div>
    <form id="form1" runat="server" class="container mt-5">
          
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center">Login</h2>
                        <div class="mb-3">
                            <asp:Label ID="UserName" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="UserNametxt" runat="server" CssClass="form-control" ></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Password" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="Passwordtxt" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="WrongPasstxt" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                        </div>
                        <div class="d-grid">
                            <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="Login" CssClass="btn btn-primary btn-block" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
