<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ReturnDVD.aspx.cs" Inherits="databaseCoursework.ReturnDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Return DVD</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover " AutoGenerateColumns ="False" DataKeyNames="loan_num,date_out" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="loan_num" HeaderText="loan_num" InsertVisible="False" ReadOnly="True" SortExpression="loan_num" />
            <asp:BoundField DataField="member_num" HeaderText="member_num" SortExpression="member_num" />
            <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" SortExpression="dvd_id" />
            <asp:BoundField DataField="copy_id" HeaderText="copy_id" SortExpression="copy_id" />
            <asp:BoundField DataField="date_out" HeaderText="date_out" ReadOnly="True" SortExpression="date_out" />
            <asp:BoundField DataField="date_due" HeaderText="date_due" SortExpression="date_due" />
            <asp:BoundField DataField="date_returned" HeaderText="date_returned" SortExpression="date_returned" />
            <asp:BoundField DataField="standardcharge" HeaderText="standardcharge" SortExpression="standardcharge" />
            <asp:BoundField DataField="penaltycharge" HeaderText="penaltycharge" SortExpression="penaltycharge" />
            <asp:BoundField DataField="charge" HeaderText="charge" SortExpression="charge" ReadOnly="True" />
             <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="returnButton" runat="server" OnClick="returnButton_Click" Text="Return" CssClass="btn btn-success"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select loan_num, member_num,loans.dvd_id, loans.copy_id, date_out, date_due, date_returned, dvd_details.standardcharge, dvd_details.penaltycharge, 
case 
when (DATEDIFF(day, loans.date_due, GETDATE())) &gt;0 then
((dvd_details.penaltycharge * DATEDIFF(day, loans.date_due, 
GETDATE())) + dvd_details.standardcharge) else standardcharge end as charge
from loans 
join dvd_details on loans.dvd_id=dvd_details.dvd_id where loans.date_returned IS NULL OR loans.date_returned = '1/1/1900'
"></asp:SqlDataSource>
                                <br />
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
