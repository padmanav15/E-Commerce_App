<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="ECommerce_App.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Add Product Title
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;color:purple;padding:5px;border:5px solid;font-style:italic">Add Products</h1>
    <div style="width:30%;padding:40px;border:5px solid purple;position:relative;left:35%">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Product Name</label>
        <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter Product Name" runat="server"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Product Category</label>
        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
            <asp:ListItem>Electronics</asp:ListItem>
            <asp:ListItem>Foods</asp:ListItem>
            <asp:ListItem>Clothes</asp:ListItem>
            <asp:ListItem>Grocery</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Product Price</label>
        <asp:TextBox ID="TextBox2" class="form-control" placeholder="Enter Product Price" runat="server"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Product Pic</label>
        <asp:FileUpload Imageurl="" class="form-control" ID="FileUpload1" runat="server" />
    </div>
        <asp:Button class="btn btn-info" ID="Button1" runat="server" Text="ADD" OnClick="Button1_Click" />
</div>
</asp:Content>
