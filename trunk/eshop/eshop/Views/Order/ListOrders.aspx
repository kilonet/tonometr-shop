<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Order>>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>
<%@ Import Namespace="eshop.core.Domain"%>

<script runat="server">private string PageTitle = "������ �������";</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle(PageTitle) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= PageTitle %></h2>
    <table class="box-table-a">
        <tr>
            <th></th>
            <th>�����</th>
            <th>����</th>
            <th>�����</th>
            <th>�����</th>
            <th>�����</th>
        </tr>
        <% foreach (var order in Model) { %>
            <tr>
                <td><a href="/Order/Details/<%= order.Id %>">��������</a></td>
                <td><%= order.Id %></td>
                <td><%= order.DateAdded.ToString("f") %></td>
                <td><%= Html.Encode(order.ShippingDetails.City) %></td>
                <td><%= Html.Encode(order.ShippingDetails.Address) %></td>
                <td><%= Html.Encode(order.GetSumm().ToString("C")) %></td>
            </tr>        
        <% } %>
    </table>
    

</asp:Content>
