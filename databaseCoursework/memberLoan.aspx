<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="memberLoan.aspx.cs" Inherits="databaseCoursework.MemberLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Member Loan Details
                        <asp:Label ID="lblTesting" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="packageGrid" CssClass="table table-bordered" runat="server" Height="154px" Width="1026px">
                        <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate >
                                        <div class="text-danger">
                                            <asp:Label ID="lblRemark" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        </div>

                                    </ItemTemplate>
                                    <HeaderTemplate>Remarks</HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        

                        <!--grid view-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
