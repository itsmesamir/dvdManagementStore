<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="loans.aspx.cs" Inherits="databaseCoursework.loans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">

     <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Loan details as per the date_out</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered">
                        </asp:GridView>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click here</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderTemplate>Loan Details</HeaderTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        
                        <asp:LinkButton ID="btnPrev" runat="server" OnClick="btnPrev_Click">Prev</asp:LinkButton>
                        
                        <br />
                        

                    </div>
                    <!--form view-->

                    <!--form view-->
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
