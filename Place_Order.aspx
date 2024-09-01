<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Place_Order.aspx.cs" Inherits="ECommerce_App.Place_Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    </head>
    <br />
    <asp:Button ID="Button1" class="btn btn-success" runat="server" OnClick="Button1_Click" Text="Download Invoice" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" class="btn btn-success" runat="server" Text="Pay Now" OnClick="Button3_Click" />
    <asp:Panel ID="Panel1" runat="server" Height="341px">
        <br />
        <h1 align="center"><b>Invoice</b></h1>
        <br />
        <table class="w-100" border="1" cellspacing="4" cellpadding="5" height: 217px" style="height: 314px">
            <tr>
                <td style="border-width: medium; border-style: solid;"><strong>Order Id : </strong><asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td style="border-width: medium; border-style: solid;"><strong>Email Id :</strong><asp:Label ID="Label4" runat="server"></asp:Label>
                    <br />
                    <br />
                    <strong>Contact No :</strong><asp:Label ID="Label5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border-width: medium; border-style: solid;"><span class="text-decoration-underline"><strong style="border-style: none">Seller Address :</strong></span><br /> B-205,Sanskruti Apt,Sekhar Road<br /> Near Ganapati Mandir,Old Post Office,560034</td>
                <td style="border-width: medium; border-style: solid;"><span class="text-decoration-underline"><strong>Buyer Address :</strong></span><br />
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-width: medium; border-style: solid;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"  Width="1251px" BorderStyle="Solid">
                        <Columns>
                            <asp:BoundField DataField="pid" HeaderText="PID" InsertVisible="False" ReadOnly="True" SortExpression="pid">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pcat" HeaderText="Product Category" SortExpression="pcat">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="perprice" HeaderText="Per Price" SortExpression="perprice">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="price" HeaderText="Total Price" SortExpression="price">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [placeorder] WHERE ([suser] = @suser)">
                        <SelectParameters>
                            <asp:SessionParameter Name="suser" SessionField="MyUser" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>   
            </tr>
            <tr>
                <td colspan="2" style="border-width: medium; border-style: solid;"><strong>Grand Total : </strong>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </td>   
            </tr>
        </table>
            
    </asp:Panel>

    
</asp:Content>
