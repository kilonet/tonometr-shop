<%@ Import Namespace="eshop.core.Domain"%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<OrderLine>>" %>
<h2>��� ������ �������</h2>
<%if ( Model.LongCount() > 0)  {%>
    <script language="javascript" type="text/javascript">
        function confirmDelete(title) { 
            var agree = confirm("������� ' " + title + "' �� �������?" );
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
            <th>����������</th>
            <th>������������</th>
            <th>����</th>
            <th>�����</th>
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
                        <input type="submit" value="�������" onclick="return confirmDelete('<%= orderLine.Name %>')"/>
                    </form>
                </td>
            </tr>
        <%} %>
    </table>
<%} else { %>
    ���� ������� �����
<% } %>
