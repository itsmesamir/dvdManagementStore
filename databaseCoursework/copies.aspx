<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="copies.aspx.cs" Inherits="databaseCoursework.Copies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
      <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary"> Find Total DVD Copies on The Shelves</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--drop down box-->
                        Select Actor's last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1"  CssClass="btn btn-info dropdown-toggle" runat="server" DataSourceID="lnameSource" DataTextField="lname" DataValueField="lname" AutoPostBack="True" Width="140px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="35px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="lnameSource" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT [lname] FROM [cast_list]"></asp:SqlDataSource>
                        <br />
            
                        <br />
                        <!--grid view-->
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"  AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="dvd_id">
                            <Columns>
                                <asp:BoundField DataField="dvd_id" HeaderText="DVD ID" InsertVisible="False" ReadOnly="True" SortExpression="dvd_id" />
                                <asp:BoundField DataField="title" HeaderText="DVD TITLE" SortExpression="title" />
                                <asp:BoundField DataField="numofcopies" HeaderText="COPIES ON SHELEVES" ReadOnly="True" SortExpression="numofcopies" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="findCopies" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select dd.dvd_id, dd.title, count(l.dvd_id) as numofcopies from dvd_details dd join dvd_cast dc on dd.dvd_id =dc.dvd_id join cast_list cl on dc.cast_id= cl.cast_id join loans l on dd.dvd_id=l.dvd_id where cl.lname='Uprety' and l.date_returned is not null group by dd.dvd_id, dd.title"></asp:SqlDataSource>

                        <br />

                        <!--grid view-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
