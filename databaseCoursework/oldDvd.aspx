<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="OldDvd.aspx.cs" Inherits="databaseCoursework.OldDvd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">List of a Year Old DVD's</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
                        <asp:GridView ID="oldDetails" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="oldDvd" AllowPaging="True" OnSelectedIndexChanged="oldDetails_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="dvd_id" HeaderText="dvd_id" InsertVisible="False" ReadOnly="True" SortExpression="dvd_id" />
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                <asp:BoundField DataField="copy_num" HeaderText="copy_num" InsertVisible="False" ReadOnly="True" SortExpression="copy_num" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="datereleased" HeaderText="datereleased" SortExpression="datereleased" />
                                <asp:TemplateField HeaderText="ACTIONS" ShowHeader="False" ControlStyle-Width="100" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:Button ID="deleteCopy" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" OnClick="deleteCopy_Click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="oldDvd" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select dvd_details.dvd_id, dvd_details.title, copy_details.copy_num, copy_details.name,
dvd_details.datereleased from dvd_details join copy_details on dvd_details.dvd_id=copy_details.
dvd_id left join loans on copy_details.copy_num= loans.copy_id where dvd_details.datereleased&lt;GETDATE()-356
and copy_details.copy_num not in (select copy_id from loans)"></asp:SqlDataSource>
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
