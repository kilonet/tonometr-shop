<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CommodityViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <%= Html.Hidden("Commodity.Id", Model.Commodity.Id) %>
            <legend>Fields</legend>
            <p>
                <label for="Commodity.Name">Name:</label>
                <%= Html.TextBox("Commodity.Name", Model.Commodity.Name)%>
                <%= Html.ValidationMessage("Commodity.Name", "*")%>
            </p>
            <p>
                <label for="Commodity.Price">Price:</label>
                <%= Html.TextBox("Commodity.Price", String.Format("{0:F}", Model.Commodity.Price))%>
                <%= Html.ValidationMessage("Commodity.Price", "*")%>
            </p>
            <p>
                <label for="Commodity.Deleted">Deleted:</label>
                <%= Html.TextBox("Commodity.Deleted", Model.Commodity.Deleted)%>
                <%= Html.ValidationMessage("Commodity.Deleted", "*")%>
            </p>
            <p>
                <label for="Commodity.Description">Description:</label>
                <%= Html.TextBox("Commodity.Description", Model.Commodity.Description)%>
                <%= Html.ValidationMessage("Commodity.Description", "*")%>
            </p>
            <p>
                <label for="Commodity.ShortDescription">ShortDescription:</label>
                <%= Html.TextBox("Commodity.ShortDescription", Model.Commodity.ShortDescription)%>
                <%= Html.ValidationMessage("Commodity.ShortDescription", "*")%>
            </p>
            <p>
                <label for="Commodity.Category.Id">Id:</label>
                <%= Html.DropDownList("Commodity.Category.Id", Model.Categories)%>
                <%= Html.ValidationMessage("Commodity.Category.Id", "*")%>
            </p>
            <p>
                Picture: <img src="<%= ResolveClientUrl("../Uploads/") + Model.Commodity.PictureFileName %>">
                Small Picture: <img src="<%= ResolveClientUrl("../Uploads/") + Model.Commodity.SmallPictureFileName %>">
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>
    
    <% using (Html.BeginForm("UploadPicture", "Commodity", FormMethod.Post, new { enctype = "multipart/form-data" })) {%>
        <%= Html.Hidden("CommodityId", Model.Commodity.Id) %>
        <p><input type="file" id="fileUpload" name="fileUpload"/></p>
        <p><input type="submit" value="Upload file" /></p>             
    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

