<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeeSupermarketAccount.aspx.cs" Inherits="_admin_ManageSupermarket" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #Text1 {
            width: 169px;
        }
        #Text2 {
            width: 169px;
        }
        #Text3 {
            width: 169px;
        }
        #Text4 {
            width: 169px;
        }
        #Text5 {
            width: 169px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, supermarket.name FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN supermarket ON aspnet_Users.UserId = supermarket.manager WHERE (aspnet_Roles.RoleName = 'manager')" ID="SqlDataSource1" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="DELETE FROM aspnet_UsersInRoles WHERE [UserId] = @Id DELETE FROM aspnet_Membership WHERE [UserId] = @Id DELETE FROM aspnet_Users WHERE [UserId] = @Id" UpdateCommand="UPDATE aspnet_Users SET UserName = FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE [UserId] = @Id">
      <DeleteParameters>
            <asp:Parameter Name="Id"/>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT u1.UserId, u1.UserName FROM aspnet_Users AS u1 INNER JOIN aspnet_UsersInRoles ON u1.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (NOT EXISTS (SELECT manager FROM supermarket AS s1 WHERE (u1.UserId = manager))) AND (aspnet_Roles.RoleName = 'manager')"></asp:SqlDataSource>

    <asp:ListView runat="server" DataSourceID="SqlDataSource1" ID="ListView1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC; ">
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>                
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC; color: #000000;">
                 <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>               
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">UserId</th>
                                <th runat="server">UserName</th>
                                <th runat="server">name</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C; font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
   
    <br />

    Manager with no shops :
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <tr style="background-color:#FAFAD2; color: #284775;">
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66;color: #000080;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#FFFBD6; color: #333333;">
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                <th runat="server">UserId</th>
                                <th runat="server">UserName</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#FFCC66; font-weight: bold;color: #000080;">
                <td>
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
   
</asp:Content>

