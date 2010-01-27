<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Cart>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>
<%@ Import Namespace="eshop.core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle("Ваша корзина") %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
   <% Html.RenderPartial("OrderLinesView", Model.Lines); %>
   
   <% if (Model.Lines.Count > 0) {%>
   <% using (Html.BeginForm("Checkout", "Cart"))
      {%>
    <h2>Ваши контактные данные</h2>
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
    <% } %>
    

</asp:Content>
