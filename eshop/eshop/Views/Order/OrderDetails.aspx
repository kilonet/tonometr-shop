<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Order>" %>
<%@ Import Namespace="eshop.core.Domain"%>
<%@ Import Namespace="eshop.FrameworkExtensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle("Информация о заказе №" + Model.Id) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Информация о заказе №<%= Model.Id %></h2>
    <% Html.RenderPartial("ShippingDetailsView", Model.ShippingDetails); %>
    <% Html.RenderPartial("OrderLinesView", Model.Lines); %>

</asp:Content>
