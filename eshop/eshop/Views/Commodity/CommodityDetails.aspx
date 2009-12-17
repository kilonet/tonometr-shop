<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.Commodity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        function submit() {
            $('#addToBasketForm').submit();
        }
    </script>
    <table>
        <tr>
            <td colspan="2">
                <span class="product-name"><%= Model.Name %> </span><br />
                <span class="product-short-description"><%= Model.ShortDescription %> </span><br />
            </td>
        </tr>
        <tr>
            <td>
                <img src="../../Content/Uploads/<%= Model.SmallPictureFileName %>"/>
            </td>
            <td colspan="2">
                <%= Model.Description %>                
            </td>
        </tr>
        <tr>
            <td align="center"><span class="price">Цена:<%= Model.Price.ToString("C") %><span></td>
            
            <td align="right">
                <% using (Html.BeginForm("AddToBasket", "Commodity", new {id = "addToBasketForm"})) {%>
                
                <%= Html.Hidden("Id", Model.Id) %>
                <%= Html.Hidden("returnUrl", ViewContext.HttpContext.Request.Url.PathAndQuery) %>
                                
                <input type="text" value="1" style="width: auto;" size="3" maxlength="2" class="input-text qty" name="Quantity"/>
                
                <button class="alt" type="button" onclick="submit()">
                    <span>Добавить в корзину</span>
                </button>
                
                
                <%} %>
            </td>
        </tr>
    </table>
</asp:Content>

