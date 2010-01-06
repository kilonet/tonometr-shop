<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<eshop.core.Domain.Category>>" %>
<%@ Import Namespace="eshop.core.Domain"%>

<%@ Import Namespace="eshop.Utils.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListCategories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>������ ���������</h2>
   <%-- <a tabindex="0" href="#news-items" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all"
        id="flyout"><span class="ui-icon ui-icon-triangle-1-s"></span>���������</a>--%>
   <%-- <div id="news-items" class="hidden">
        <%= Html.CategoryTree(Model) %>
    </div>--%>
    <table>
        <tr>
            <th>��������</th>
            <th>��������</th>
            <th></th>
        </tr>
        <% foreach (Category category in Model) {%>
            <tr>
                <td><%= Html.Encode(category.Name) %></td>
                <td><%=Html.Encode(category.Parent != null ? category.Parent.Name : "") %></td>
                <td><a href="/Category/Edit/<%= category.Id %>">�������������</a></td>
            </tr>
        <% } %>
    </table>    
    
    
    <%= Html.ActionLink("�������� ����� ���������", "Create") %>
</asp:Content>
