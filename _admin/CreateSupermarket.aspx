<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateSupermarket.aspx.cs" Inherits="_admin_CreateSupermarket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT vw_aspnet_Users.UserId, vw_aspnet_Users.UserName FROM vw_aspnet_Users INNER JOIN aspnet_UsersInRoles ON vw_aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = 'manager')"></asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label><br />
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox> <br />
    <asp:Label ID="Label3" runat="server" Text="Adress"></asp:Label><br />
    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox><br /> 
    <asp:Label ID="Label2" runat="server" Text="Manager"></asp:Label><br />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="NULL">No manager</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Create a manager" OnClick="Button2_Click" />
    <asp:CheckBox ID="check_box_no_manager" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="No manager account" />
    <br />  
    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label><br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>  <br />  
    <asp:Label ID="Label5" runat="server" Text="Telephon"></asp:Label><br />
    <asp:TextBox ID="txtTelephon" runat="server"></asp:TextBox>  
    <br />
    <br />  
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create" /> <br />
    <asp:Label ID="txtInfo" runat="server" Text=""></asp:Label>
</asp:Content>

