<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="databaseCoursework.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                   <h2 class="m-0 font-weight-bold text-primary"> I am Logged in as: <asp:Label ID="LabelUser" runat="server" Text=""></asp:Label> </h2> 
                </div>
                <div class="card-body">
                    <div style="float: right">
                        <asp:Button ID="BtnLogout" CssClass="btn btn-danger" runat="server" Text="Logout" OnClick="BtnLogout_Click" />
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
