<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="kursovoi.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    
    <!-- Custom styles for this template -->
    
  </head>
    <style>

html,div{background-color:rgb(21,25,29)}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
    </style>
<body>
    
    
<main class="form-signin w-50 m-auto">
  <form>
    
    <h1 class="h3 mb-3 fw-normal ">Register</h1>

    <div class="form-floating">
      
        
        <asp:TextBox class="form-control" ID="email_label" TextMode="Email" runat="server" >email</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_label" ErrorMessage="некорректный email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        <asp:TextBox class="form-control" ID="login_rgistr" runat="server">login</asp:TextBox>
        <asp:TextBox class="form-control" ID="name_registr" runat="server">name</asp:TextBox>
    </div>
    <div class="form-floating">
      <asp:TextBox class="form-control" ID="pass_registr" runat="server">password</asp:TextBox>
      <asp:TextBox class="form-control" ID="pass_repit_registr" runat="server">repit password</asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pass_registr" ControlToValidate="pass_repit_registr" EnableClientScript="False" ErrorMessage="Введен неверный пароль!"></asp:CompareValidator>
    </div>

    <div class="checkbox mb-3">
   
        <asp:Button CssClass="w-100 btn btn-lg btn-primary" ID="Button3" runat="server" Text="Button" Width="2109px" OnClick="Button3_Click" />
   
    </div>
    
    <p class="mt-5 mb-3 text-muted" >&copy; Powered by SUAI</p>
  </form>
</main>


    
  </body>
</asp:Content>
