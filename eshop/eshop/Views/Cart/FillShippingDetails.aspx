<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<eshop.core.Domain.ShippingDetails>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	������� ���������� � ������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>������� ���������� � ������</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm("PreviewOrder", "Cart"))
       {%>

        <fieldset>
            <p>
                <label for="Name">���� ���:</label>
                <%= Html.TextBox("Name") %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
                <label for="Phone">���������� �������:</label>
                <%= Html.TextBox("Phone") %>
                <%= Html.ValidationMessage("Phone", "*") %>
            </p>
            <p>
                <label for="City">�����:</label>
                <%= Html.TextBox("City") %>
                <%= Html.ValidationMessage("City", "*") %>
            </p>
            <p>
                <label for="Address">����� ��������:</label>
                <%= Html.TextBox("Address") %>
                <%= Html.ValidationMessage("Address", "*") %>
            </p>
            <p>
                <label for="Comment">�����������:</label>
                <%= Html.TextArea("Comment") %>
                <%= Html.ValidationMessage("Comment", "*") %>
            </p>
            <p>
                <input type="submit" value="���������" />
            </p>
        </fieldset>

    <% } %>

</asp:Content>

