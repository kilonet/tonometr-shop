<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<Commodity>>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>
<%@ Import Namespace="eshop.core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle("Список товаров") %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Список товаров</h2>
    
    <table class="box-table-a">
        <thead>
            <tr>
                <th></th>
                <th>Наименование</th>
                <th>Цена</th>
                <th>Категория</th>
                <th>Выводить в списке</th>
            </tr>
        </thead>
        <tfoot>
	        <tr>
	              <td colspan="5">Всего наименований: <%= Model.Count %></td>
	        </tr>
		</tfoot>
        <% foreach (Commodity commodity in Model) {%>
        <tr>
            <td><a href="/Commodity/Edit/<%= commodity.Id %>">редактировать</a> | <a href="/Commodity/Details/<%= commodity.Id %>">в каталоге</a></td>
            <td><%= commodity.Name%></td>
            <td><%= commodity.Price.ToString("c")%></td>
            <td><%= commodity.Category.Name%></td>
            <td><%= commodity.Deleted ? "нет" : "да"%></td>
        </tr>
        <% } %>
    </table>
    <a href="/Commodity/Create">Добавить новый</a>

</asp:Content>
