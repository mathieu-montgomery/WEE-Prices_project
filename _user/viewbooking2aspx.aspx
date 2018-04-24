<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewbooking2aspx.aspx.cs" Inherits="_student_viewbooking2aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name] FROM [room]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [room], [bookedby], [time], [date] FROM [bookings] WHERE ([room] = @room)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="room" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" AutoPostBack="true">
    </asp:DropDownList>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <li style="">room:
                <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
                <br />
                bookedby:
                <asp:Label ID="bookedbyLabel" runat="server" Text='<%# Eval("bookedby") %>' />
                <br />
                time:
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                <br />
                date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="">room:
                <asp:TextBox ID="roomTextBox" runat="server" Text='<%# Bind("room") %>' />
                <br />
                bookedby:
                <asp:TextBox ID="bookedbyTextBox" runat="server" Text='<%# Bind("bookedby") %>' />
                <br />
                time:
                <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
                <br />
                date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>

        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>

        <InsertItemTemplate>
            <li style="">room:
                <asp:TextBox ID="roomTextBox" runat="server" Text='<%# Bind("room") %>' />
                <br />
                bookedby:
                <asp:TextBox ID="bookedbyTextBox" runat="server" Text='<%# Bind("bookedby") %>' />
                <br />
                time:
                <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
                <br />
                date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>

        <ItemTemplate>
            <li style="">room:
                <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
                <br />
                bookedby:
                <asp:Label ID="bookedbyLabel" runat="server" Text='<%# Eval("bookedby") %>' />
                <br />
                time:
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                <br />
                date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />
            </li>
        </ItemTemplate>

        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="">room:
                <asp:Label ID="roomLabel" runat="server" Text='<%# Eval("room") %>' />
                <br />
                bookedby:
                <asp:Label ID="bookedbyLabel" runat="server" Text='<%# Eval("bookedby") %>' />
                <br />
                time:
                <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                <br />
                date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>

