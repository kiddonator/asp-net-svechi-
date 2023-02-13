<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="kursovoi.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" EmptyDataText="Нет записей для отображения.">
        <Columns>
            <asp:BoundField DataField="name_svechi" HeaderText="название свечи" SortExpression="name_svechi" />
            <asp:BoundField DataField="price" HeaderText="цена (рубли)" SortExpression="price" />
        </Columns>
    </asp:GridView>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource2" DataTextField="name_svechi" DataValueField="id_svechi" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT [name_svechi], [price] FROM [catalog]"></asp:AccessDataSource>
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="заказать" />
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\KursDB.accdb" SelectCommand="SELECT [name_svechi], [price], [id_svechi] FROM [catalog]"></asp:AccessDataSource>
    <asp:Label ID="error_new_order" runat="server" Text="Для заказа необходимо авторизоваться!" Visible="False"></asp:Label>

</asp:Content>

