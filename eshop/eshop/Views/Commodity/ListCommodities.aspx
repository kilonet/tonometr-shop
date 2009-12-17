<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Commodity>>" %>
<%@ Import Namespace="eshop.core.Domain"%>




<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <%--<table>
        <tr>
            <th></th>
            <th>
                Name
            </th>
            <th>
                Price
            </th>
            <th>
                Deleted
            </th>
            <th>
                Description
            </th>
            <th>
                ShortDescription
            </th>
            <th>
                SmallPictureFileName
            </th>
            <th>
                Id
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new {  item.Id  }) %> |
                <%= Html.ActionLink("Details", "Details", new { item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Price)) %>
            </td>
            <td>
                <%= Html.Encode(item.Deleted) %>
            </td>
            <td>
                <%= item.Description %>
            </td>
            <td>
                <%= Html.Encode(item.ShortDescription) %>
            </td>
            <td>
                <img src="../../Content/Uploads/<%= item.SmallPictureFileName %>" />
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
        </tr>
    
    <% } %>

    </table>--%>
    <div class="example">
        <ul> 
        <% foreach (Commodity commodity in Model)
           {%>
                <li>
                        <a href="/Commodity/Details/<%= commodity.Id %>">
                            <img src="../../Content/Uploads/<%= commodity.SmallPictureFileName %>"/><br />
                            <%= commodity.Name %><br />
                        </a>
                   <%= commodity.Price.ToString("c") %>
                </li>
        <% } %>
        </ul>
    </div>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

