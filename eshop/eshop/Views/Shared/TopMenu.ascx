<%@ Import Namespace="System.Security.Principal"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IPrincipal>" %>
<ul>
    <li><a href="/Cart/"><% Html.RenderPartial("CartControl"); %></a></li>
	<% if (Model.Identity.IsAuthenticated) {%>
	    <li><a href="/Order/">Заказы</a></li>
	    <li><a href="/Commodity/List">Товары</a></li>
    	<li><a href="/Category/">Категории</a></li>
    	<li><a href="/Account/LogOff/">Выход</a></li>
	<% } %>
</ul>