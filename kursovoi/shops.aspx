<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="shops.aspx.cs" Inherits="kursovoi.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" EmptyDataText="корзина пуста" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        <Columns>
            <asp:BoundField DataField="name_svechi" HeaderText="name_svechi" SortExpression="name_svechi" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT * FROM [status]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT [name_svechi], [status], [price] FROM [Запрос1] WHERE ([id_client] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="id_client" SessionField="IDU" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <style>
        {
    box-sizing: border-box;
  }
   
  html,
  body {
    width: 100%;
    height: 100%;
    margin: 0;
    background-color: #dd9a5c;
    font-family: 'Roboto', sans-serif;
  }
  .shopping-cart {
    width: 750px;
    height: 423px;
    margin: 80px auto;
    background: #FFFFFF;
    box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
    border-radius: 6px;
   
    display: flex;
    flex-direction: column;
  }
  .title {
    height: 60px;
    border-bottom: 1px solid #E1E8EE;
    padding: 20px 30px;
    color: #5E6977;
    font-size: 18px;
    font-weight: 400;
  }
   
  .item {
    padding: 20px 30px;
    height: 120px;
    display: flex;
  }
   
  .item:nth-child(3) {
    border-top:  1px solid #E1E8EE;
    border-bottom:  1px solid #E1E8EE;
  }
  .buttons {
    position: relative;
    padding-top: 30px;
    margin-right: 60px;
  }
  .delete-btn,
  .like-btn {
    display: inline-block;
    Cursor: pointer;
  }
  .delete-btn {
    width: 18px;
    height: 17px;
    background: url("delete-icn.svg") no-repeat center;
  }
   
  .like-btn {
    position: absolute;
    top: 9px;
    left: 15px;
    background: url('twitter-heart.png');
    width: 60px;
    height: 60px;
    background-size: 2900%;
    background-repeat: no-repeat;
  }
  .is-active {
    animation-name: animate;
    animation-duration: .8s;
    animation-iteration-count: 1;
    animation-timing-function: steps(28);
    animation-fill-mode: forwards;
  }
   
  @keyframes animate {
    0%   { background-position: left;  }
    50%  { background-position: right; }
    100% { background-position: right; }
  }
  .image {
    margin-right: 50px;
  }
   
 
  .description {
    padding-top: 10px;
    margin-right: 60px;
    width: 115px;
  }
   
  .description span {
    display: block;
    font-size: 14px;
    color: #43484D;
    font-weight: 400;
  }
   
  .description span:first-child {
    margin-bottom: 5px;
  }
  .description span:last-child {
    font-weight: 300;
    margin-top: 8px;
    color: #86939E;
  }
  .quantity {
    padding-top: 20px;
    margin-right: 60px;
  }
  .quantity input {
    
    border: none;
    text-align: center;
    width: 32px;
    font-size: 16px;
    color: #43484D;
    font-weight: 300;
  }
   
 
  .minus-btn img {
    margin-bottom: 3px;
  }
  .plus-btn img {
    margin-top: 2px;
  }
   
  button:focus,
  input:focus {
    outline:0;
  }
  .total-price {
    width: 83px;
    padding-top: 27px;
    text-align: center;
    font-size: 16px;
    color: #43484D;
    font-weight: 300;
  }
  @media (max-width: 800px) {
    .shopping-cart {
      width: 100%;
      height: auto;
      overflow: hidden;
    }
    .item {
      height: auto;
      flex-wrap: wrap;
      justify-content: center;
    }
    .image img {
      width: 50%;
    }
    .image,
    .quantity,
    .description {
      width: 100%;
      text-align: center;
      margin: 6px 0;
    }
    
  }
    </style>

<asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="AccessDataSource3" EmptyDataText="Нет записей для отображения.">
    <Columns>
        <asp:BoundField DataField="id_client" HeaderText="ID клиента" InsertVisible="False" SortExpression="id_client" />
        <asp:BoundField DataField="name_svechi" HeaderText="название свечи" SortExpression="name_svechi" />
        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
        <asp:BoundField DataField="price" HeaderText="цена" SortExpression="price" />
    </Columns>
</asp:GridView>
<table class="w-100">
    <tr>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource4" DataTextField="id_order" DataValueField="id_order">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="AccessDataSource2" DataTextField="status" DataValueField="id_status">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="изменить статус заказа" />
            <asp:Label ID="label_ch_up_ord" runat="server" Text="Статус заказа обновлен" Visible="False"></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="удалить заказ" />
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="AccessDataSource4" DataTextField="id_order" DataValueField="id_order">
            </asp:DropDownList>
            <asp:Label ID="label_del_up_ord" runat="server" Text="Заказ удален" Visible="False"></asp:Label>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT * FROM [Запрос1]"></asp:AccessDataSource>
<asp:AccessDataSource ID="AccessDataSource4" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT [id_order] FROM [order]"></asp:AccessDataSource>

</asp:Content>
