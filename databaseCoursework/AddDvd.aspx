<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="AddDvd.aspx.cs" Inherits="databaseCoursework.AddDvd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">

    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">DVD Details</h2>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="card-body form-group col-md-6">
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        TITLE: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtTitle" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        CATEGORY NAME: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:DropDownList ID="dropListCategory" runat="server" Height="30px" Width="200px">
                        </asp:DropDownList>
                        <br />
                        <br />
                        NUMBER OF COPIES: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCopyNo" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        DATE RELEASED: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtDateReleased" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        STANDARD CHARGE: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtStandardCharge" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        PENALTY CHARGE: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPenaltyCharge" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        STUDIO NAME: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtStudioName" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        PRODUCER NAME: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtProducerName" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        CAST FIRST NAME:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtCastFirstName" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        CAST LAST NAME: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCastLastName" runat="server" Height="30px" Width="200px" />
                        <br />
                        <br />
                        CAST ROLE: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="listRole" runat="server" Height="30px" Width="200px">
                        </asp:DropDownList>

                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" CssClass="btn btn-lg btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" Width="150px" OnClick="InsertButton_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-lg btn-danger" runat="server" CausesValidation="False" CommandName="Clear" Text="Clear" Width="150px" OnClick="InsertCancelButton_Click" />

                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>

