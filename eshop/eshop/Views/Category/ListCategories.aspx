<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<eshop.core.Domain.Category>>" %>
<%@ Import Namespace="eshop.core.Domain"%>

<%@ Import Namespace="eshop.Utils.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListCategories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Список категорий</h2>
    <table class="box-table-a">
        <tr>
            <th></th>
            <th>Название</th>
            <th>Родитель</th>
        </tr>
        <% foreach (Category category in Model) {%>
            <tr>
                <td><a href="/Category/Edit/<%= category.Id %>">редактировать</a></td>
                <td><%= Html.Encode(category.Name) %></td>
                <td><%=Html.Encode(category.Parent != null ? category.Parent.Name : "") %></td>
            </tr>
        <% } %>
    </table>    
    <%= Html.ActionLink("Добавить новую категорию", "Create") %>
</asp:Content>
