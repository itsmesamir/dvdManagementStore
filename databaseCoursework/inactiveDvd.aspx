<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="inactiveDvd.aspx.cs" Inherits="databaseCoursework.InactiveDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
     <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">List of DVD not on Loan any since last 31 days </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="notOnLoanGrid" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="inactiveDvd" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="date_out" HeaderText="date_out" SortExpression="date_out" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="inactiveDvd" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select distinct title, l.date_out from dvd_details dd left join loans l
on dd.dvd_id=l.dvd_id  where l.dvd_id not in
(select dvd_id from loans where date_out&gt;= GETDATE()-31)"></asp:SqlDataSource>
                        <!--grid view-->

                    </div>

                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
