<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<eshop.core.Domain.Category>>" %>
<%@ Import Namespace="eshop.core.Domain"%>

<%@ Import Namespace="eshop.Utils.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListCategories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>������ ���������</h2>
    <table class="box-table-a">
        <tr>
            <th></th>
            <th>��������</th>
            <th>��������</th>
        </tr>
        <% foreach (Category category in Model) {%>
            <tr>
                <td><a href="/Category/Edit/<%= category.Id %>">�������������</a></td>
                <td><%= Html.Encode(category.Name) %></td>
                <td><%=Html.Encode(category.Parent != null ? category.Parent.Name : "") %></td>
            </tr>
        <% } %>
    </table>    
    <%= Html.ActionLink("�������� ����� ���������", "Create") %>
</asp:Content>
