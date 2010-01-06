<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryView>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">

function confirmDelete() {
	var answer = confirm("Удалить категорию?")
	if (answer){
	    return true;
	}
	else {
	    return false;
	}
}

</script>
    <h2>Edit</h2>
    <% using (Html.BeginForm()) {%>
        <%= Html.Hidden("Category.Id", Model.Category.Id) %>
        <table>
        <tr>
            <td>Название:</td>
            <td>
                <%= Html.TextBox("Category.Name", Model.Category.Name) %>
                <%= Html.ValidationMessage("Category.Name", "*") %>
            </td>
        </tr>
        <tr>
            <td>Родительская категория</td>
            <td>
                <%= Html.DropDownList("Category.Parent.Id", this.GetCategories())%>
                <%= Html.ValidationMessage("Category.Parent.Id", "*") %>
            </td>
        </tr>
        <tr>
            <td colspan="2"> 
                <%= Html.ValidationSummary("При вводе данных были допущены ошибки") %>
                <%--<%= Html.ValidationMessage("non.empty.category")%>
                <%= Html.ValidationMessage("has.subcategories")%>--%>
            </td>
        </tr>
    </table>
    
    <input type="submit" value="Сохранить" />
    <% } %>
    
    <form action="/Category/Delete" method="post">
        <input type="hidden" value="<%= Model.Category.Id %>" name="Category.Id"/>
        <input type="submit" value="Удалить" onclick="return confirmDelete();"/>
    </form>
    
    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

