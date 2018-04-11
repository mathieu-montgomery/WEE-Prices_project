<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #txtFeedback {
            height: 167px;
            width: 274px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Give us some feedback!"></asp:Label>
    <br />
    <asp:TextBox id="txtFeedback" TextMode="multiline" Columns="30" Rows="5" runat="server" />    
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
    <asp:Label ID="result" runat="server" Text=""></asp:Label>
</asp:Content>

