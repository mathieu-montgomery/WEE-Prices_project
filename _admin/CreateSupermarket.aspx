<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateSupermarket.aspx.cs" Inherits="_admin_CreateSupermarket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label><br />
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox> <br />
    <asp:Label ID="Label3" runat="server" Text="Adress"></asp:Label><br />
    <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox><br /> 
    <asp:Label ID="Label2" runat="server" Text="Manager"></asp:Label><br />
    <asp:TextBox ID="txtManager" runat="server"></asp:TextBox>  <br />  
    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label><br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>  <br />  
    <asp:Label ID="Label5" runat="server" Text="Telephon"></asp:Label><br />
    <asp:TextBox ID="txtTelephon" runat="server"></asp:TextBox>  <br />  
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /> <br />
    <asp:Label ID="txtInfo" runat="server" Text=""></asp:Label>
</asp:Content>

