<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryView>" %>
<%@ Import Namespace="eshop.Filters"%>
<%@ Import Namespace="eshop.FrameworkExtensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Добавление новой категории</h2>
    <% using (Html.BeginForm()) {%>
    <table>
        <tr>
            <td>Название:</td>
            <td>
                <%= Html.TextBox("Category.Name") %>
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
    <input type="submit" value="Создать" />
        

    <% } %>

    <div>
        <%=Html.ActionLink("Назад к списку", "Index") %>
    </div>

</asp:Content>

