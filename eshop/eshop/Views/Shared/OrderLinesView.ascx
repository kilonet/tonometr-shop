<%@ Import Namespace="eshop.core.Domain"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<OrderLine>>" %>
 <table>
        <tr>
            <th>Количество</th>
            <th>Наименование</th>
            <th>Цена</th>
            <th>Сумма</th>
            <th></th>
        </tr>
        <% foreach (OrderLine orderLine in Model) {%>
        <tr>
            <td><%= orderLine.Quantity %></td>
            <td><%= orderLine.Name %></td>
            <td><%= orderLine.Price.ToString("C") %></td>
            <td><%= (orderLine.Price * orderLine.Quantity).ToString("C") %></td>
        </tr>
        
    <%} %>
    </table>
