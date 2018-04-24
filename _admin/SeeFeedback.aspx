<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeeFeedback.aspx.cs" Inherits="_admin_SeeFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [username], [description], [Id] FROM [feedback]" DeleteCommand="DELETE FROM [feedback] WHERE [Id] = @Id" InsertCommand="INSERT INTO [feedback] ([username], [description]) VALUES (@username, @description)" UpdateCommand="UPDATE [feedback] SET [username] = @username, [description] = @description WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="txtInfo" runat="server" Text=""></asp:Label>


    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="selected" DataKeyNames="Id">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No Feedback.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Username</th>
                                <th runat="server">Description</th>
                                <th runat="server"></th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>


</asp:Content>

