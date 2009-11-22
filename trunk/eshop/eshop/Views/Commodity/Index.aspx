<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<eshop.core.Domain.Commodity>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
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
                PictureFileName
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
                <%= Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%= Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%>
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
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.ShortDescription) %>
            </td>
            <td>
                <%= Html.Encode(item.PictureFileName) %>
            </td>
            <td>
                <%= Html.Encode(item.SmallPictureFileName) %>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

