<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ECommerce_App.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" Width="1243px" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:TemplateField HeaderText="Photo">
                <ItemTemplate>
                    <asp:Image height="120px" width="80px" ImageUrl='<%#Eval("pic") %>' runat="server"></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="P_Id">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("pid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("pcat") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Price">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("perprice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("qty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Total Price">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("dt") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <div>
                         <i  class="fa fa-trash" style="color:white;position:relative;left:32px;font-size:20px;bottom:8px;top:2px"></i><asp:Button ID="Button1" runat="server" CommandName="Delete"  Text="" style="height:30px;width:50px;background:red;border:2px solid red;border-radius:10px" />
                    </div>                   
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <div style="background:white;border:2px solid purple;padding:20px;width:300px"><b>Grand Total :</b>
        &nbsp;Rs.<asp:Label ID="Label8" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <br />
    <div style="width:30%">
    Address <asp:TextBox  class="form-control" ID="TextBox1" runat="server" placeholder="Enter Address......" Height="100px" TextMode="MultiLine" Width="452px"></asp:TextBox>
        <br />
    Contact No <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Enter Contact Number..."></asp:TextBox>
     </div>
    <br />
    &emsp;&emsp;<a href="AllProducts.aspx"><button type="button" class="btn btn-danger"><i class="fa fa-arrow-left"  style="color:white;font-size:20px"></i>  Continue Shopping</button></a>
    &emsp;&emsp;<asp:Button ID="Button2" class="btn btn-success" runat="server" Text="PlaceOrder" OnClick="Button2_Click" />
    <br />
    <br />
    <br />

</asp:Content>
