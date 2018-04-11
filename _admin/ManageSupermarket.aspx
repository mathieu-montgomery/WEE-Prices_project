<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageSupermarket.aspx.cs" Inherits="_admin_ManageSupermarket" %>

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
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1">
        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                TabPanel1
            </HeaderTemplate>
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [adress], [manager], [telephone], [email] FROM [supermarket]"></asp:SqlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                            </td>
                            <td>
                                <asp:Label ID="managerLabel" runat="server" Text='<%# Eval("manager") %>' />
                            </td>
                            <td>
                                <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                            </td>
                            <td>
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
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
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="adressTextBox" runat="server" Text='<%# Bind("adress") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="managerTextBox" runat="server" Text='<%# Bind("manager") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
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
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="adressTextBox" runat="server" Text='<%# Bind("adress") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="managerTextBox" runat="server" Text='<%# Bind("manager") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                            </td>
                            <td>
                                <asp:Label ID="managerLabel" runat="server" Text='<%# Eval("manager") %>' />
                            </td>
                            <td>
                                <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                            </td>
                            <td>
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">Name</th>
                                            <th runat="server">Adress</th>
                                            <th runat="server">Manager</th>
                                            <th runat="server">Telephone</th>
                                            <th runat="server">Email</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            </td>
                            <td>
                                <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                            </td>
                            <td>
                                <asp:Label ID="managerLabel" runat="server" Text='<%# Eval("manager") %>' />
                            </td>
                            <td>
                                <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                            </td>
                            <td>
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <ContentTemplate>
                <asp:Label ID="txtName" runat="server" Text="Name"></asp:Label>
                <input id="Text1" type="text" />
                <asp:Label ID="txtAdress" runat="server" Text="Adress"></asp:Label>
                <input id="Text2" type="text" />
                <asp:Label ID="txtManager" runat="server" Text="Manager"></asp:Label>
                <input id="Text3" type="text" />
                <asp:Label ID="txtEmail" runat="server" Text="Email"></asp:Label>
                <input id="Text4" type="text" />
                <asp:Label ID="txtTelephon" runat="server" Text="Telephone"></asp:Label>
                <input id="Text5" type="text" />
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <asp:Label ID="txtInfo" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
        </asp:TabPanel>
    </asp:TabContainer>
   
    <asp:TabContainer ID="TabContainer3" runat="server" ActiveTabIndex="1">
        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel6">
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel7">
        </asp:TabPanel>
    </asp:TabContainer>
   
</asp:Content>

