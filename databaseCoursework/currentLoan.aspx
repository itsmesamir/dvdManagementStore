<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="currentLoan.aspx.cs" Inherits="databaseCoursework.CurrentLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary"> List of Copies currently on Loan</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="customerDetailGrid" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="dvd_id" DataSourceID="currentLoanCopy">
                            <Columns>
                                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" InsertVisible="False" ReadOnly="True" SortExpression="dvd_id" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />
                                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                                <asp:BoundField DataField="date_out" HeaderText="date_out" SortExpression="date_out" />
                                <asp:BoundField DataField="loancount" HeaderText="loancount" ReadOnly="True" SortExpression="loancount" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="currentLoanCopy" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT dvd_details.dvd_id, dvd_details.title, loans.copy_id, member_details.fname, member_details.lname, loans.date_out, COUNT(loans.loan_num) AS loancount FROM dvd_details INNER JOIN loans ON dvd_details.dvd_id = loans.dvd_id INNER JOIN member_details ON loans.member_num = member_details.member_num WHERE (loans.date_returned IS NULL) GROUP BY loans.date_out, dvd_details.dvd_id, dvd_details.title, loans.copy_id, member_details.fname, member_details.lname ORDER BY loans.copy_id, dvd_details.title"></asp:SqlDataSource>
                        <!--grid view-->
                    </div>
                    <!--form view-->

                    <!--form view-->
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
