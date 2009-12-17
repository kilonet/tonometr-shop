<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Cart>" %>
<%@ Import Namespace="eshop.core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewCart
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <table>
        <tr>
            <th>Количество</th>
            <th>Наименование</th>
            <th>Цена</th>
            <th>Сумма</th>
            <th></th>
        </tr>
        <% foreach (OrderLine orderLine in Model.Lines) {%>
        <tr>
            <td><%= orderLine.Quantity %></td>
            <td><%= orderLine.Name %></td>
            <td><%= orderLine.Price.ToString("C") %></td>
            <td><%= (orderLine.Price * orderLine.Quantity).ToString("C") %></td>
        </tr>
        
    <%} %>
    </table>
    <% using (Html.BeginForm("Checkout", "Cart"))
       {%>
    <b>Контактные данные</b>
    
    <table>
        <tr>
            <td>Ваше имя:</td>
            <td><%= Html.TextBox("Name")%>
            <%= Html.ValidationMessage("Name", "*")%></td>
        </tr>
        <tr>
            <td>Контактный телефон:</td>
            <td><%= Html.TextBox("Phone")%>
            <%= Html.ValidationMessage("Phone", "*")%></td>
        </tr>
        <tr>
            <td>Город:</td>
            <td><%= Html.TextBox("City")%>
            <%= Html.ValidationMessage("City", "*")%></td>
        </tr>
        <tr>
            <td>Адрес доставки:</td>
            <td><%= Html.TextBox("Address")%>
            <%= Html.ValidationMessage("Address", "*")%></td>
        </tr>
        <tr>
            <td>Комментарий:</td>
            <td><%= Html.TextArea("Comment")%></td>
        </tr>
        <tr>
            <td colspan="2"><%= Html.ValidationSummary("При вводе данных были допущены ошибки")%> </td>
        </tr>
    </table>
     
    
     <input type="submit" value="Отправить" />
    <% } %>
    

</asp:Content>
