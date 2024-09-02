<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerce_App.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 20px; border: 5px solid green; width: 25%; position: absolute; left: 35%">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Enter Email Id"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Password</label>
                <asp:TextBox ID="TextBox2" class="form-control" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" class="btn btn-success" Style="width: 100%" runat="server" Text="Login" OnClick="Button1_Click" /><br />
            <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-success" style="width: 100%; background: none; color: green; border: none; text-decoration: underline">Create New Account</a>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create New Account</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Username</label>
                            <asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="Enter Username"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <asp:TextBox ID="TextBox4" class="form-control" runat="server" placeholder="Enter Email Id"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Password</label>
                            <asp:TextBox ID="TextBox5" class="form-control" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Profile</label>
                            <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
                        </div>
                        <asp:Button ID="Button2" class="btn btn-success" Style="width: 100%" runat="server" Text="Sign Up" OnClick="Button2_Click1" /><br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
