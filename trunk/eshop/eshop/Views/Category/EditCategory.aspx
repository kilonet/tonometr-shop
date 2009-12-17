<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryView>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("При вводе данных были допущены ошибки") %>

    <% using (Html.BeginForm()) {%>
        <%= Html.Hidden("Category.Id", Model.Category.Id) %>
        <table>
        <tr>
            <td>Название:</td>
            <td>
                <%= Html.TextBox("Category.Name", Model.Category.Name) %>
                <%= Html.ValidationMessage("Category.Name", "*") %>
            </td>
        </tr>
        <tr>
            <td>Родительская категория</td>
            <td>
                <%= Html.DropDownList("Category.Parent.Id", this.GetCategories())%>
                <%= Html.ValidationMessage("Category.Parent.Id", "*") %>
            </td>
        </tr>
        <tr>
            <td colspan="2"> <%= Html.ValidationSummary("При вводе данных были допущены ошибки") %></td>
        </tr>
    </table>
    <input type="submit" value="Сохранить"/>
    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

