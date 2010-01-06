<%@ Import Namespace="eshop.core.Domain"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ShippingDetails>" %>

<table>
    <tr>
        <td>Имя</td>
        <td><%= Html.Encode(Model.Name) %></td>
    </tr>
    <tr>
        <td>Телефон</td>
        <td><%= Html.Encode(Model.Phone) %></td>
    </tr>
    <tr>
        <td>Город</td>
        <td><%= Html.Encode(Model.City) %></td>
    </tr>
    <tr>
        <td>Адрес</td>
        <td><%= Html.Encode(Model.Address) %></td>
    </tr>
    <tr>
        <td>Комментарий</td>
        <td><%= Html.Encode(Model.Comment) %></td>
    </tr>
</table>

