<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Commodity>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.PageTitle(new string[] {"Информация о товаре", Model.Name}) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Scripts/ald-openpicturewindow.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function submit() {
            $('#addToBasketForm').submit();
        }
    </script>
    <table>
        <tr>
            <td colspan="2">
                <h1><%= Model.Name %></h1>
                <h2><%= Model.ShortDescription %></h2>
            </td>
        </tr>
        <tr>
            <td valign="top">
                    <img src="../../Content/Uploads/<%= Model.SmallPictureFileName %>" alt="<%= Model.Name %>" style="cursor: pointer;" title="Открыть большую картинку в новом окне"
                    onclick="ald_OpenPictureWindow('../../Content/Uploads/<%= Model.PictureFileName %>', 'iimagebrowser', '','800','600',true,'<%= Model.Name %>')"/>
            </td>
            <td colspan="2">
                <%= Model.Description %>                
            </td>
        </tr>
        <tr>
            <td align="center"><h2>Цена:<%= Model.Price.ToString("C") %></h2></td>
            
            <td align="right">
                <% using (Html.BeginForm("AddToBasket", "Commodity", new {id = "addToBasketForm"})) {%>
                
                <%= Html.Hidden("Id", Model.Id) %>
                <%= Html.Hidden("returnUrl", ViewContext.HttpContext.Request.Url.PathAndQuery) %>
                Количество:                                
                <input type="text" value="1" style="width: auto;" size="3" maxlength="2" name="Quantity"/>
                <input type="button" onclick="submit()" value="Добавить в корзину">
                <%} %>
            </td>
        </tr>
    </table>
</asp:Content>

