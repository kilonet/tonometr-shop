<%@ Import Namespace="eshop.core.Domain"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<OrderLine>>" %>
<h2>Ваш список покупок</h2>
<%if ( Model.LongCount() > 0)  {%>
    <script language="javascript" type="text/javascript">
        function confirmDelete(title) { 
            var agree = confirm("Удалить ' " + title + "' из корзины?" );
            if (agree) {
                $('#orderLineName').val(title);
                return true;
            } else
                return false;
        }
    </script>
    <table class="box-table-a">
        <thead>
        <tr>
            <th>Количество</th>
            <th>Наименование</th>
            <th>Цена</th>
            <th>Сумма</th>
            <th></th>
        </tr>
        </thead>
            <% foreach (OrderLine orderLine in Model) {%>
            <tr>
                <td><%= orderLine.Quantity %></td>
                <td><%= orderLine.Name %></td>
                <td><%= orderLine.Price.ToString("C") %></td>
                <td><%= (orderLine.Price * orderLine.Quantity).ToString("C") %></td>
                <td>
                    <form action="/Cart/Remove/" method="post">
                        <input type="hidden" name="name" id="orderLineName"/>
                        <input type="submit" value="удалить" onclick="return confirmDelete('<%= orderLine.Name %>')"/>
                    </form>
                </td>
            </tr>
        <%} %>
    </table>
<%} else { %>
    Ваша корзина пуста
<% } %>
