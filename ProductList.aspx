<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ECommerce_App.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="pid" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="369px" PageSize="4" Width="1172px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:ImageField DataImageUrlField="pic" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="pid" HeaderText="Prod Id" InsertVisible="False" ReadOnly="True" SortExpression="pid">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="pcat" HeaderText="Prod Category" SortExpression="pcat">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="Prod Price" SortExpression="price">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="mdt" HeaderText="Date" SortExpression="mdt">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True">
            <ControlStyle BackColor="#00CCFF" BorderColor="#00CCFF" BorderStyle="Solid" BorderWidth="2px" ForeColor="White" Height="30px" Width="100px" Font-Underline="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [product] WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([mdt] = @original_mdt) OR ([mdt] IS NULL AND @original_mdt IS NULL))" InsertCommand="INSERT INTO [product] ([pname], [pcat], [pic], [price], [mdt]) VALUES (@pname, @pcat, @pic, @price, @mdt)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [product]" UpdateCommand="UPDATE [product] SET [pname] = @pname, [pcat] = @pcat, [pic] = @pic, [price] = @price, [mdt] = @mdt WHERE [pid] = @original_pid AND (([pname] = @original_pname) OR ([pname] IS NULL AND @original_pname IS NULL)) AND (([pcat] = @original_pcat) OR ([pcat] IS NULL AND @original_pcat IS NULL)) AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([mdt] = @original_mdt) OR ([mdt] IS NULL AND @original_mdt IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_pname" Type="String" />
            <asp:Parameter Name="original_pcat" Type="String" />
            <asp:Parameter Name="original_pic" Type="String" />
            <asp:Parameter Name="original_price" Type="Decimal" />
            <asp:Parameter Name="original_mdt" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pname" Type="String" />
            <asp:Parameter Name="pcat" Type="String" />
            <asp:Parameter Name="pic" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="mdt" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pname" Type="String" />
            <asp:Parameter Name="pcat" Type="String" />
            <asp:Parameter Name="pic" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="mdt" Type="String" />
            <asp:Parameter Name="original_pid" Type="Int32" />
            <asp:Parameter Name="original_pname" Type="String" />
            <asp:Parameter Name="original_pcat" Type="String" />
            <asp:Parameter Name="original_pic" Type="String" />
            <asp:Parameter Name="original_price" Type="Decimal" />
            <asp:Parameter Name="original_mdt" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
