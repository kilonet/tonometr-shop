<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CommodityView>" %>
<%@ Import Namespace="eshop.FrameworkExtensions"%>
<%@ Import Namespace="eshop.Views.Account"%>


<script runat="server">private string PageTitle = "���������� ������ ������";</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

	<%= Html.PageTitle(PageTitle)%>
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

    <h2><%= PageTitle %></h2>
    <% using (Html.BeginForm()) {%>
    
        <table>
            <tr>
                <td>��������</td>
                <td>
                    <%= Html.TextBox("Commodity.Name") %>
                    <%= Html.ValidationMessage("Commodity.Name", "*") %>
                </td>
            </tr>  
            <tr>
                <td>����</td>
                <td>
                    <%= Html.TextBox("Commodity.Price") %>
                    <%= Html.ValidationMessage("Commodity.Price", "*") %>
                </td>
            </tr>
            <tr>
                <td>�� �������� ����� � ������</td>
                <td>
                    <%= Html.CheckBox("Commodity.Deleted") %>
                    <%= Html.ValidationMessage("Commodity.Deleted", "*") %>
                </td>
            </tr>        
            <tr>
                <td>��������</td>
                <td>
                    <%= Html.TextArea("Commodity.Description")%>
                    <%= Html.ValidationMessage("Commodity.Description", "*") %>
                </td>
            </tr> 
            <tr>
                <td>������� ��������</td>
                <td>
                    <%= Html.TextBox("Commodity.ShortDescription") %>
                    <%= Html.ValidationMessage("Commodity.ShortDescription", "*") %>
                </td>
            </tr> 
            <tr>
                <td>���������</td>
                <td>
                    <%= Html.DropDownList("Commodity.Category.Id", ViewData.Model.Categories)%>
                    <%= Html.ValidationMessage("Commodity.Category.Id", "*")%>
                </td>
            </tr> 
            <tr><td colspan="2"><%= Html.ValidationSummary("��� ����� ������ ���� �������� ������")%></td></tr>
        </table>

        <input type="submit" value="�������� �����" />
    <% } %>

    <div>
        <%=Html.ActionLink("����� � ������", "Index") %>
    </div>

</asp:Content>

