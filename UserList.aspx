<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="ECommerce_App.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center" Width="1135px" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField HeaderText="Profile">
                <ItemTemplate>
                    <asp:Image  ID="Image1" Height="100px" Width="100px" ImageUrl='<%#Eval("acc_profile") %>' runat="server"></asp:Image>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("acc_user") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("acc_email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("acc_role") %>'></asp:Label>
                 </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="Button1" class="btn btn-danger" CommandName="Delete"  runat="server" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Center" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
</asp:Content>
