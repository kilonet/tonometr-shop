<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CommodityView>" %>
<%@ Import Namespace="eshop.Views.Account"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
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

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                Name:
                <%= Html.ValidationMessage("Commodity.Name", "*") %>
                <%= Html.TextBox("Commodity.Name") %>
                <%= Html.ValidationMessage("Commodity.Name", "*") %>
            </p>
            <p>
                Price:
                <%= Html.TextBox("Commodity.Price") %>
                <%= Html.ValidationMessage("Commodity.Price", "*") %>
            </p>
            <p>
                Deleted:
                <%= Html.CheckBox("Commodity.Deleted") %>
                <%= Html.ValidationMessage("Commodity.Deleted", "*") %>
            </p>
            <p>
                Description:
                <textarea id="description" name="Commodity.Description" cols=60></textarea>
                <%= Html.ValidationMessage("Commodity.Description", "*") %>
            </p>
            <p>
                ShortDescription:
                <%= Html.TextBox("Commodity.ShortDescription") %>
                <%= Html.ValidationMessage("Commodity.ShortDescription", "*") %>
            </p>
            <p>
                Категория
                <%= Html.DropDownList("Commodity.Category.Id", ViewData.Model.Categories)%>
                <%= Html.ValidationMessage("Commodity.Category.Id", "*")%>
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

