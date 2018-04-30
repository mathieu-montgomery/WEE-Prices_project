<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Search for products</h3>
    <asp:DropDownList ID="SelectSupermarket" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="supermarket_id" AutoPostBack="true" ></asp:DropDownList>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <input id="Submit1" type="submit" value="submit" /><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT supermarket.name, product_supermarket.supermarket_id FROM product_supermarket INNER JOIN supermarket ON product_supermarket.supermarket_id = supermarket.Id"></asp:SqlDataSource>
    <br /><br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Nr." SortExpression="Id" InsertVisible="False" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" ItemStyle-HorizontalAlign="Center"/>
            <asp:TemplateField HeaderText="img" SortExpression="img">
              
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%# Bind("img") %>'></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:BoundField DataField="price" HeaderText="Price in Euro" SortExpression="Price" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT product.[Id], [name], [description], [img], supermarket_id, price FROM [product], product_supermarket  WHERE ([supermarket_id] = @Id) AND product.id = product_supermarket.product_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="SelectSupermarket" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>

