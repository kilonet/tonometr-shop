<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CommodityView>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>

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
            theme: "simple"
        });
    </script>

        
        <% using (Html.BeginForm())
           {%>
                <%= Html.Hidden("Commodity.Id", Model.Commodity.Id) %>
            <table>
                <tr>
                    <td>��������:</td>
                    <td>
                        <%= Html.TextBox("Commodity.Name", Model.Commodity.Name)%>
                        <%= Html.ValidationMessage("Commodity.Name", "*")%>
                    </td>
                </tr>
                <tr>
                    <td>����:</td>
                    <td>
                        <%= Html.TextBox("Commodity.Price", String.Format("{0:F}", Model.Commodity.Price))%>
                    <%= Html.ValidationMessage("Commodity.Price", "*")%>
                    </td>
                </tr>
                <tr>
                    <td>�� �������� ����� � ������:</td>
                    <td>
                        <%= Html.CheckBox("Commodity.Deleted", Model.Commodity.Deleted)%>
                        <%= Html.ValidationMessage("Commodity.Deleted", "*")%>
                    </td>
                </tr>
                <tr>
                    <td>��������:</td>
                    <td>
                        Description:
                        <textarea id="description" name="Commodity.Description" cols="60">
                            <%= Model.Commodity.Description %>
                        </textarea>
                        <%= Html.ValidationMessage("Commodity.Description", "*") %>
                    </td>
                </tr>
                <tr>
                    <td>�������� ��������:</td>
                    <td>
                        <%= Html.TextBox("Commodity.ShortDescription", Model.Commodity.ShortDescription)%>
                        <%= Html.ValidationMessage("Commodity.ShortDescription", "*")%>
                    </td>
                </tr>
                 <tr>
                    <td>���������:</td>
                    <td>
                        <%= Html.DropDownList("Commodity.Category.Id", this.GetCategories())%>
                        <%= Html.ValidationMessage("Commodity.Category.Id", "*")%>
                    </td>
                </tr>
                <tr>
                    <td>��������</td>
                    <td>
                        <img src="<%= ResolveClientUrl("~/Content/Uploads/") + Model.Commodity.SmallPictureFileName%>" />
                    </td>
                </tr>
                <tr>
                    <td>������� ��������</td>
                    <td>
                        <img src="<%= ResolveClientUrl("~/Content/Uploads/") + Model.Commodity.PictureFileName %>" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><%= Html.ValidationSummary("��� ����� ������ ���� �������� ������") %></td>
                </tr>
            </table>
            <input type="submit" value="���������" />
        <% } %>
        
        <% using (Html.BeginForm("UploadPicture", "Commodity", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>
            <%= Html.Hidden("CommodityId", Model.Commodity.Id)%>
            ��������� ����� ��������<br />
            <input type="file" id="fileUpload" name="fileUpload" /></p>
            
            <input type="submit" value="���������" /></p>
        <% } %>
        <div>
            <%=Html.ActionLink("����� � ������", "Index") %>
        </div>

</asp:Content>
