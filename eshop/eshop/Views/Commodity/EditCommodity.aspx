<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CommodityView>" %>

<%@ Import Namespace="eshop.Views.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/tiny_mce/tiny_mce.js" type="text/javascript"></script>

    <script type="text/javascript">
        tinyMCE.init({
            // General options
            mode: "textareas",
            theme: "simple",
        });
    </script>


        <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>
        <% using (Html.BeginForm())
           {%>
        <fieldset>
            <%= Html.Hidden("Commodity.Id", Model.Commodity.Id) %>
            <legend>Fields</legend>
            <p>
                Name:
                <%= Html.TextBox("Commodity.Name", Model.Commodity.Name)%>
                <%= Html.ValidationMessage("Commodity.Name", "*")%>
            </p>
            <p>
                Price:
                <%= Html.TextBox("Commodity.Price", String.Format("{0:F}", Model.Commodity.Price))%>
                <%= Html.ValidationMessage("Commodity.Price", "*")%>
            </p>
            <p>
                Deleted:
                <%= Html.TextBox("Commodity.Deleted", Model.Commodity.Deleted)%>
                <%= Html.ValidationMessage("Commodity.Deleted", "*")%>
            </p>
            <p>
                Description:
                <textarea id="description" name="Commodity.Description" cols="60">
                    <%= Model.Commodity.Description %>
                </textarea>
                <%= Html.ValidationMessage("Commodity.Description", "*") %>
            </p>
            <p>
                ShortDescription:
                <%= Html.TextBox("Commodity.ShortDescription", Model.Commodity.ShortDescription)%>
                <%= Html.ValidationMessage("Commodity.ShortDescription", "*")%>
            </p>
            <p>
                Id:
                <%= Html.DropDownList("Commodity.Category.Id", Model.Categories)%>
                <%= Html.ValidationMessage("Commodity.Category.Id", "*")%>
            </p>
            <p>
                Picture:
                <img src="<%= ResolveClientUrl("~/Content/Uploads/") + Model.Commodity.PictureFileName %>">
                Small Picture:
                <img src="<%= ResolveClientUrl("~/Content/Uploads/") + Model.Commodity.SmallPictureFileName %>">
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>
        <% } %>
        <% using (Html.BeginForm("UploadPicture", "Commodity", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>
        <%= Html.Hidden("CommodityId", Model.Commodity.Id)%>
        <p>
            <input type="file" id="fileUpload" name="fileUpload" /></p>
        <p>
            <input type="submit" value="Upload file" /></p>
        <% } %>
        <div>
            <%=Html.ActionLink("Back to List", "Index") %>
        </div>

</asp:Content>
