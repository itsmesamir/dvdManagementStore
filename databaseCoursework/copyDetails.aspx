<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="copyDetails.aspx.cs" Inherits="databaseCoursework.CopyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Copy Details</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--drop down box-->
                        Select a Copy Number&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1" CssClass="btn btn-info dropdown-toggle" runat="server" DataSourceID="SelectCopyNumber" DataTextField="copy_num" DataValueField="copy_num" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SelectCopyNumber" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [copy_num] FROM [copy_details]"></asp:SqlDataSource>
                        &nbsp;
                        <br />
                        <br />
                        <!--grid view-->
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False" >
                            <columns>
                                <asp:BoundField DataField="copy_id" HeaderText="Copy ID" SortExpression="copy_id" />
                                <asp:BoundField DataField="member_num" HeaderText="Member ID" SortExpression="member_num" />
                                <asp:BoundField DataField="fname" HeaderText="FirstName" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="Last name " SortExpression="lname" />
                                <asp:BoundField DataField="date_out" HeaderText=" date Out" SortExpression="date_out" />
                                <asp:BoundField DataField="date_due" HeaderText="Date Due" SortExpression="date_due" />
                                <asp:BoundField DataField="date_returned" HeaderText="Date Returned " SortExpression="date_returned" />
                                <asp:BoundField DataField="dvd" HeaderText="DVD" SortExpression="dvd" />
                            </columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="CopyDetails1" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select copy_id, loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title as dvd from loans join member_details on loans.member_num=member_details.member_num join dvd_details on dvd_details.dvd_id=loans.dvd_id group by copy_id,loans.member_num, member_details.fname, member_details.lname, date_out, date_due, date_returned, dvd_details.title having date_out = (select max(date_out) from loans where copy_id=20010) and copy_id=20010"></asp:SqlDataSource>

                        <!--grid view-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
