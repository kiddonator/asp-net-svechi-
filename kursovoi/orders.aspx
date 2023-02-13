<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="kursovoi.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="w-100">
       
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" EmptyDataText="Нет записей для отображения.">
    <Columns>
        <asp:BoundField DataField="name_svechi" HeaderText="название свечи" SortExpression="name_svechi" />
        <asp:BoundField DataField="status" HeaderText="статус готовности" SortExpression="status" />
        <asp:BoundField DataField="price" HeaderText="цена (рубли)" SortExpression="price" />
    </Columns>
</asp:GridView>
<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT [name_svechi], [status], [price] FROM [Запрос1] WHERE ([id_client] = ?)">
    <SelectParameters>
        <asp:SessionParameter Name="id_client" SessionField="IDU" Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
</asp:Content>
