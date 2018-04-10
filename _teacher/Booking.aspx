<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="_teacher_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Booking<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [room]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [time] FROM [time]"></asp:SqlDataSource>
    </p>
    <p>
        Room :
        <asp:DropDownList ID="dpRoom" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name">
        </asp:DropDownList>
    </p>
        <asp:Label ID="dateLabel" runat="server" Width="60px" Text="Date:"></asp:Label>
        <asp:TextBox ID="dateText" runat="server" Width="114px"></asp:TextBox>
    <p>
        Time :
        <asp:DropDownList ID="dpTime" runat="server" DataSourceID="SqlDataSource3" DataTextField="time" DataValueField="time">
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Validate" /> <br />
        <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>
    </p>
</asp:Content>

