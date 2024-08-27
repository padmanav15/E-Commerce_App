<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="ECommerce_App.AllProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button class="btn btn-danger" ID="Button2" runat="server" Text="Low To High" OnClick="Button2_Click" />
    <asp:Button class="btn btn-danger" ID="Button3" runat="server" Text="High To Low" OnClick="Button3_Click" />
    <br />
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" Width="1250px" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="card" style="width: 18rem;">
                <img src='<%#Eval("pic") %>' height="150px" width="80px" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%#Eval("pname") %></h5>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Category : </b><%#Eval("pcat") %></li>
                    <li class="list-group-item"><b>Price :</b> <%#Eval("price") %></li>
                    <li class="list-group-item"><b>Quantity :</b>
                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
                <div class="card-body">
                    <asp:Button class="btn btn-info" ID="Button1" CommandName="AddToCart" CommandArgument='<%#Eval("pid") %>' runat="server" Text="Add To Cart" />
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
