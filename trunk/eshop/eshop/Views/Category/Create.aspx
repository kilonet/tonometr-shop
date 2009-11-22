<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CategoryViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Category.Name">Name:</label>
                <%= Html.TextBox("Category.Name") %>
                <%= Html.ValidationMessage("Category.Name", "*") %>
            </p>
            <p>
                <label for="Category.Parent.Id">Parent Id:</label>
                <%= Html.DropDownList("Category.Parent.Id",  ViewData.Model.ParentCategories)%>
                <%= Html.ValidationMessage("Category.Parent.Id", "*") %>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

