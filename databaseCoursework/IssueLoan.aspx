<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="IssueLoan.aspx.cs" Inherits="databaseCoursework.IssueLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
     <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Issue Loan</h2>
                    <p class="m-0 font-weight-bold text-primary">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add Loan</asp:LinkButton>
                    </p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">        
                        
                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="loan_num,date_out" DataSourceID="loanIssue" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="loan_num" HeaderText="Loan Num" InsertVisible="False" ReadOnly="True" SortExpression="loan_num" />
                                <asp:BoundField DataField="member_num" HeaderText="Mem Num" SortExpression="member_num" />
                                <asp:BoundField DataField="dvd_id" HeaderText="DVD" SortExpression="dvd_id" />
                                <asp:BoundField DataField="copy_id" HeaderText="Copy" SortExpression="copy_id" />
                                <asp:BoundField DataField="date_out" HeaderText="DateOut"  SortExpression="date_out" ReadOnly="True" />
                                <asp:BoundField DataField="date_due" HeaderText="DateDue" SortExpression="date_due" />
                                <asp:BoundField DataField="date_returned" HeaderText="DateReturned" SortExpression="date_returned" />
                                <asp:BoundField DataField="standardcharge" HeaderText="Standardcharge" SortExpression="standardcharge" />
                                <asp:BoundField DataField="penaltycharge" HeaderText="Penaltycharge" SortExpression="penaltycharge" />
                                <asp:BoundField DataField="charge" HeaderText="Charge" ReadOnly="True" SortExpression="charge" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="loanIssue" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select loan_num, member_num,loans.dvd_id, loans.copy_id, date_out, date_due, date_returned, dvd_details.standardcharge, dvd_details.penaltycharge, 
case 
when (DATEDIFF(day, loans.date_due, GETDATE())) &gt;0 then
((dvd_details.penaltycharge * DATEDIFF(day, loans.date_due, 
GETDATE())) + dvd_details.standardcharge) else standardcharge end as charge
from loans 
join dvd_details on loans.dvd_id=dvd_details.dvd_id ">
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel1" runat="server" Width="400px" BorderColor="#CCCCFF" BorderWidth="1px" ForeColor="Black">
                            <h2 style="color:red;">Add new Loan</h2><br />
                            <asp:Label ID="Label1" runat="server" Text="Loan Type ID:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="drop_loanId" runat="server" DataSourceID="loanType" DataTextField="type_id" DataValueField="type_id" OnSelectedIndexChanged="drop_loanId_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="loanType" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [type_id] FROM [loan_type]"></asp:SqlDataSource>
                            <br /><br />
                            <asp:Label ID="Label2" runat="server" Text="Copy ID:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="drop_copyId" runat="server" DataSourceID="copyId" DataTextField="copy_num" DataValueField="copy_num" AutoPostBack="True" OnSelectedIndexChanged="drop_copyId_SelectedIndexChanged"></asp:DropDownList><asp:SqlDataSource ID="copyId" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [copy_num] FROM [copy_details]"></asp:SqlDataSource>
                            <br /><br />
                            <asp:Label ID="Label3" runat="server" Text="Member Number:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="drop_memNum" runat="server" DataSourceID="memberNum" DataTextField="member_num" DataValueField="member_num" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="memberNum" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [member_num] FROM [member_details]"></asp:SqlDataSource>
                            <br /><br />
                            <asp:Label ID="Label5" runat="server" Text="Date Out:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtDateOut" runat="server" Width="98px" Enabled="False" ReadOnly="True"></asp:TextBox>
                            <br /><br />
                            <asp:Label ID="Label6" runat="server" Text="Date Due:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtDateDue" runat="server" Width="104px" Enabled="False" ReadOnly="True"></asp:TextBox>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                            <asp:Label ID="Label4" runat="server" Text="DVD ID:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="drop_dvdId" runat="server" DataSourceID="dvdId" DataTextField="dvd_id" DataValueField="dvd_id" AutoPostBack="True" Enabled="False">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dvdId" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select distinct dvd_id from copy_details"></asp:SqlDataSource>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddLoan" runat="server" CssClass="btn btn-success" OnClick="btnAddLoan_Click" Text="Add Loan" />
                            <br />
                            <br />
                            &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>

                            &nbsp;
                            <asp:Label ID="message" runat="server" ForeColor="Red"></asp:Label>

                        </asp:Panel>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
