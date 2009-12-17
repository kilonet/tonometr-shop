<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<List<eshop.core.Domain.Category>>" %>

<%@ Import Namespace="eshop.Utils.HtmlHelpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListCategories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    
    <h2>
        ListCategories</h2>
   <%-- <a tabindex="0" href="#news-items" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all"
        id="flyout"><span class="ui-icon ui-icon-triangle-1-s"></span>Категории</a>--%>
   <%-- <div id="news-items" class="hidden">
        <%= Html.CategoryTree(Model) %>
    </div>--%>
    
    
    <%= Html.CategoryTree(Model) %>
    
    
    <%= Html.ActionLink("Create New", "Create") %>
</asp:Content>
