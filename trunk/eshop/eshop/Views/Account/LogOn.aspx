<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log On
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Вход</h2>
    
     <%= Html.ValidationMessage("loginFail") %>

    <% using (Html.BeginForm()) { %>
        <div>
                <p>
                    <label for="username">Логин:</label>
                    <%= Html.TextBox("username") %>
                </p>
                <p>
                    <label for="password">Пароль:</label>
                    <%= Html.Password("password") %>
                </p>
                <p>
                    <%= Html.CheckBox("rememberMe") %> <label class="inline" for="rememberMe">Запомнить меня?</label>
                </p>
                <p>
                    <input type="submit" value="Войти" />
                </p>
        </div>
    <% } %>
</asp:Content>
