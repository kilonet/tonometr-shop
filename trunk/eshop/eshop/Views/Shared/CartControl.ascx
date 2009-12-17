<%@ Import Namespace="eshop.Binders"%>
<%@ Import Namespace="eshop.core.Domain"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    Cart cart = Session[CartModelBinder.CartSessionKey] as Cart; %>
<% if (cart != null && cart.Lines.Count > 0) {%>

    <%= Html.ActionLink(string.Format("Корзина ({0})", cart.Lines.Count), "Index", "Cart") %>

<% } else {%>
    Корзина пуста
<% } %>

