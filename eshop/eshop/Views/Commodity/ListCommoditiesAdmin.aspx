<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<Commodity>>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>
<%@ Import Namespace="eshop.core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle("������ �������") %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>������ �������</h2>
    
    <table class="box-table-a">
        <thead>
            <tr>
                <th></th>
                <th>������������</th>
                <th>����</th>
                <th>���������</th>
                <th>�������� � ������</th>
            </tr>
        </thead>
        <tfoot>
	        <tr>
	              <td colspan="5">����� ������������: <%= Model.Count %></td>
	        </tr>
		</tfoot>
        <% foreach (Commodity commodity in Model) {%>
        <tr>
            <td><a href="/Commodity/Edit/<%= commodity.Id %>">�������������</a> | <a href="/Commodity/Details/<%= commodity.Id %>">� ��������</a></td>
            <td><%= commodity.Name%></td>
            <td><%= commodity.Price.ToString("c")%></td>
            <td><%= commodity.Category.Name%></td>
            <td><%= commodity.Deleted ? "���" : "��"%></td>
        </tr>
        <% } %>
    </table>
    <a href="/Commodity/Create">�������� �����</a>

</asp:Content>
