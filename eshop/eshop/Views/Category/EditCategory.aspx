<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryView>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("��� ����� ������ ���� �������� ������") %>

    <% using (Html.BeginForm()) {%>
        <%= Html.Hidden("Category.Id", Model.Category.Id) %>
        <table>
        <tr>
            <td>��������:</td>
            <td>
                <%= Html.TextBox("Category.Name", Model.Category.Name) %>
                <%= Html.ValidationMessage("Category.Name", "*") %>
            </td>
        </tr>
        <tr>
            <td>������������ ���������</td>
            <td>
                <%= Html.DropDownList("Category.Parent.Id", this.GetCategories())%>
                <%= Html.ValidationMessage("Category.Parent.Id", "*") %>
            </td>
        </tr>
        <tr>
            <td colspan="2"> <%= Html.ValidationSummary("��� ����� ������ ���� �������� ������") %></td>
        </tr>
    </table>
    <input type="submit" value="���������"/>
    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

