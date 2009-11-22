<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.ViewModels.CommodityViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../../Content/jwysiwyg-0.5/jquery.wysiwyg.js" type="text/javascript"></script>
    <link href="../../Content/jwysiwyg-0.5/jquery.wysiwyg.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $().ready(function() {
        $('#description').wysiwyg({
            controls: {
                bold: { visible: true, tags: ['b', 'strong'], css: { fontWeight: 'bold'} },
                italic: { visible: true, tags: ['i', 'em'], css: { fontStyle: 'italic'} },
                strikeThrough: { visible: true },
                underline: { visible: true },

                separator00: { visible: true },

                justifyLeft: { visible: true },
                justifyCenter: { visible: true },
                justifyRight: { visible: true },
                justifyFull: { visible: true },

                separator01: { visible: true },

                indent: { visible: true },
                outdent: { visible: true },

                separator02: { visible: true },

                subscript: { visible: true },
                superscript: { visible: true },

                separator03: { visible: true },

                undo: { visible: true },
                redo: { visible: true },

                separator04: { visible: true },

                insertOrderedList: { visible: true },
                insertUnorderedList: { visible: true },
                insertHorizontalRule: { visible: true },
                separator06: { separator: true },
                separator07: { visible: true },
                cut: { visible: true },
                copy: { visible: true },
                paste: { visible: true },
                html: { visible: true }
            }
        });

        });

    </script>

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Commodity.Name">Name:</label>
                <%= Html.TextBox("Commodity.Name") %>
                <%= Html.ValidationMessage("Commodity.Name", "*") %>
            </p>
            <p>
                <label for="Commodity.Price">Price:</label>
                <%= Html.TextBox("Commodity.Price") %>
                <%= Html.ValidationMessage("Commodity.Price", "*") %>
            </p>
            <p>
                <label for="Commodity.Deleted">Deleted:</label>
                <%= Html.CheckBox("Commodity.Deleted") %>
                <%= Html.ValidationMessage("Commodity.Deleted", "*") %>
            </p>
            <p>
                <label for="Commodity.Description">Description:</label>
                <textarea id="description" name="Commodity.Description" cols=60></textarea>
                <%= Html.ValidationMessage("Commodity.Description", "*") %>
            </p>
            <p>
                <label for="Commodity.ShortDescription">ShortDescription:</label>
                <%= Html.TextBox("Commodity.ShortDescription") %>
                <%= Html.ValidationMessage("Commodity.ShortDescription", "*") %>
            </p>
            <p>
                <label for="Commodity.Category.Id">Категория</label>
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

