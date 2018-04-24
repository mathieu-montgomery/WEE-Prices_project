<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewBooking.aspx.cs" Inherits="_student_ViewBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        View Bookings!</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [room], [bookedby], [date], [time] FROM [bookings]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
            <asp:BoundField DataField="bookedby" HeaderText="bookedby" SortExpression="bookedby" />
            <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="date" SortExpression="date" />
            <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
        </Columns>
    </asp:GridView>
</asp:Content>

