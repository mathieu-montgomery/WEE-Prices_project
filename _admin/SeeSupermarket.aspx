<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeeSupermarket.aspx.cs" Inherits="_admin_ManageSupermarket" %>

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
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT supermarket.name, supermarket.adress, supermarket.telephone, supermarket.email, supermarket.Id, aspnet_Users.UserName FROM supermarket INNER JOIN aspnet_Users ON supermarket.manager = aspnet_Users.UserId" ID="SqlDataSource1" DeleteCommand="DELETE FROM [supermarket] WHERE [Id] = @Id" InsertCommand="INSERT INTO [supermarket] ([name], [adress], [manager], [telephone], [email]) VALUES (@name, @adress, @manager, @telephone, @email)" UpdateCommand="UPDATE [supermarket] SET [name] = @name, [adress] = @adress, [manager] = @manager, [telephone] = @telephone, [email] = @email WHERE [Id] = @Id" OnSelecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="Manager" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="Manager" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView runat="server" DataSourceID="SqlDataSource1" ID="ListView1" DataKeyNames="Id">
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'/>
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
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="adressTextBox" runat="server" Text='<%# Bind("adress") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'/>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">Name</th>
                                <th runat="server">Adress</th>
                                <th runat="server">Telephone</th>
                                <th runat="server">Email</th>
                                <th runat="server"></th>
                                <th runat="server">Manager Account</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="IdLabel" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
   
</asp:Content>

