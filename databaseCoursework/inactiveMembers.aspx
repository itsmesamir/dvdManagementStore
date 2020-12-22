<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="inactiveMembers.aspx.cs" Inherits="databaseCoursework.InActiveMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Members who has not loanned any copy since last 31 days </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="designationDetails" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="inactiveMembers" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                                <asp:BoundField DataField="mem_address" HeaderText="mem_address" SortExpression="mem_address" />
                                <asp:BoundField DataField="date_out" HeaderText="date_out" SortExpression="date_out" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="NumberOfDaysSinceLastLoan" HeaderText="NumberOfDaysSinceLastLoan" ReadOnly="True" SortExpression="NumberOfDaysSinceLastLoan" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="inactiveMembers" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select fname, lname, mem_address, l.date_out, title, datediff(DAY, l.date_out, GETDATE()) as NumberOfDaysSinceLastLoan from
member_details md  join loans l on md.member_num= l.member_num join dvd_details dd on dd.dvd_id=
l.dvd_id where date_out&lt;GETDATE()-31 
group by date_out, fname, lname,mem_address, title order by date_out"></asp:SqlDataSource>
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
