<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Compare.aspx.cs" Inherits="Compare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:TextBox ID="TextBox1" placeholder="Search product" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="True">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
               <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="img" SortExpression="img">
               
                <ItemTemplate>
                    <asp:Image ID="Label1" runat="server" ImageUrl='<%# Bind("img") %>' Height="50"></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="Expr2" HeaderText="Supermarket" SortExpression="Expr2" />
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT product.id, product.name, product.description, product.img, supermarket.name AS Expr2, product_supermarket.price
FROM product, supermarket, product_supermarket 
WHERE product_supermarket.product_id=product.id AND supermarket.id = product_supermarket.supermarket_id ORDER BY product.name, product_supermarket.price ASC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT product.id, product.description, product.name, product.img, supermarket.name AS Expr2, product_supermarket.price
FROM product, supermarket, product_supermarket
WHERE product_supermarket.product_id=product.id AND supermarket.id = product_supermarket.supermarket_id AND product.[name] LIKE @name + '%' ORDER BY product.name, product_supermarket.price ASC">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>

    </asp:Content>

