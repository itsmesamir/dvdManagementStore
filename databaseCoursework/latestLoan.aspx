<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="latestLoan.aspx.cs" Inherits="databaseCoursework.LatestLoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

                  <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary"> Total DVD Copies Loaned to a Member in last 31 Days</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--drop down box-->
                        Select Member Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="memberdropDown" CssClass="btn btn-info dropdown-toggle" AutoPostBack="True" runat="server" Height="39px" Width="156px" DataTextField="member_num" DataValueField="member_num" DataSourceID="memberNumber" OnSelectedIndexChanged="memberdropDown_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="memberNumber" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [member_num] FROM [member_details]"></asp:SqlDataSource>
                        <br />
                        <br />
                        <!--grid view-->
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                                <asp:BoundField DataField="dvd_id" HeaderText="DVD ID" SortExpression="dvd_id" />
                                <asp:BoundField DataField="copy_id" HeaderText="COPY ID" SortExpression="copy_id" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="copiesLoanedToMember" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select md.fname,md.lname, title, l.dvd_id, l.copy_id from dvd_details dd join loans l on dd.dvd_id=l.dvd_id join member_details md on l.member_num=md.member_num where l.date_out&gt;=GETDATE()-31 and md.member_num='100005'"></asp:SqlDataSource>

                        <!--grid view-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
