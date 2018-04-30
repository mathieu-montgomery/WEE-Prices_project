<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="adress" HeaderText="adress" SortExpression="adress" />
            <asp:BoundField DataField="manager" HeaderText="manager" SortExpression="manager" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="telephone" HeaderText="telephone" SortExpression="telephone" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [supermarket] WHERE [Id] = @Id" InsertCommand="INSERT INTO [supermarket] ([name], [adress], [manager], [email], [telephone]) VALUES (@name, @adress, @manager, @email, @telephone)" SelectCommand="SELECT [Id], [name], [adress], [manager], [email], [telephone] FROM [supermarket] WHERE ([manager] = @manager)" UpdateCommand="UPDATE [supermarket] SET [name] = @name, [adress] = @adress, [manager] = @manager, [email] = @email, [telephone] = @telephone WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="adress" Type="String" />
            <asp:Parameter Name="manager" Type="Object" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="manager" PropertyName="SelectedValue" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="adress" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="manager" PropertyName="SelectedValue" Type="Object" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

