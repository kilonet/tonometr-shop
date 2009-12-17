<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Cart>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	��������������� �������� ������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>��������������� �������� ������</h2>
    <b>������ �������</b><br />
    <table>
        <tr>
            <th>������������</th>
            <th>�����������</th>
            <th>����</th>
            <th>�������</th>
        </tr>
    <% foreach (var line in Model.Lines){%>
        <tr>
            <td><%= line.Name %></td>
            <td><%= line.Quantity %></td>
            <td><%= line.Price.ToString("C") %></td>
            <td><%= line.TotalPrice().ToString("C") %></td>
        </tr>
    <% } %>
    <tr>
        <td></td>
        <td>����� ���������:</td>
        <td><%= Model.ComputeTotalValue().ToString("C") %></td>
        <td></td>
    </tr>
    </table>
    <b>���������� ������</b><br />
    

    

    

</asp:Content>

