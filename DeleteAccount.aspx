<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="DeleteAccount.aspx.cs" Inherits="ECommerce_App.DeleteAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
        <itemtemplate>
            <div class="card" style="width: 18rem;">
                <img height="100" width="100" src='<%#Eval("acc_profile") %>' class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%#Eval("acc_user") %></h5>
                    </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Email Id : <%#Eval("acc_email") %></li>
                    <li class="list-group-item">Role : <%#Eval("acc_role") %></li>
                </ul>
                <div class="card-body">
                    <asp:Button ID="Button1" class="btn btn-danger" CommandName="Delete" CommandArgument='<%#Eval("id") %>' runat="server" Text="Delete" />
                </div>
            </div>
        </itemtemplate>
    </asp:DataList>
</asp:Content>
