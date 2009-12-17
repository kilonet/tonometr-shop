<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Предварительный просмотр заказа
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Предварительный просмотр заказа</h2>
    <b>Список товаров</b><br />
    <table>
        <tr>
            <th>Наименование</th>
            <th>Количестово</th>
            <th>Цена</th>
            <th>Подитог</th>
        </tr>
    <% foreach (var line in Model.Lines){%>
        <tr>
            <td><%= line.Name %></td>
            <td><%= line.Quantity %></td>
            <td><%= line.Price.ToString("C") %></td>
            <td><%= line.TotalPrice().ToString("C") %></td>
        </tr>
    <% } %>
    <tr>
        <td></td>
        <td>Общая стоимость:</td>
        <td><%= Model.ComputeTotalValue().ToString("C") %></td>
        <td></td>
    </tr>
    </table>
    <b>Контактные данные</b><br />
    

    

    

</asp:Content>

