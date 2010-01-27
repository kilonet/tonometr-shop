<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryView>" %>
<%@ Import Namespace="eshop.Filters"%>
<%@ Import Namespace="eshop.FrameworkExtensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>���������� ����� ���������</h2>
    <% using (Html.BeginForm()) {%>
    <table>
        <tr>
            <td>��������:</td>
            <td>
                <%= Html.TextBox("Category.Name") %>
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
    <input type="submit" value="�������" />
        

    <% } %>

    <div>
        <%=Html.ActionLink("����� � ������", "Index") %>
    </div>

</asp:Content>

