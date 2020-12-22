<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="databaseCoursework.LoanPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <br />
                <h2 class="m-0 font-weight-bold text-primary"> &nbsp;&nbsp;&nbsp; User Authentication</h2>
                <br />
                First Name
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Static" ErrorMessage="Required User name" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                <br />
                Password&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Static" ErrorMessage=" RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtPassword" runat="server"></asp:RequiredFieldValidator>
                <br />
                <asp:CheckBox ID="chkRemember" CssClass="form-check"  Text="Remember Me" Checked="true" runat="server" />
                <br />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="BtnLogin" runat="server" CssClass="btn btn-lg btn-info" Text="Login" OnClick="BtnLogin_Click" Width="150px" />
                <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label>

            </div>
            <div class="col-md-4">
            </div>

        </div>
    </form>
</asp:Content>
