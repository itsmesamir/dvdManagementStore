<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="dvdDetails.aspx.cs" Inherits="databaseCoursework.DvdDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">DVD Details</h2>
                    <p class="m-0 font-weight-bold text-primary">&nbsp;</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--drop down box-->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="dvd_id" CssClass="table table-hover table-bordered">
                            <Columns>
                                <asp:BoundField DataField="dvd_id" HeaderText="DVD ID" InsertVisible="False" ReadOnly="True" SortExpression="dvd_id" />
                                <asp:BoundField DataField="title" HeaderText="DVD TITLE" SortExpression="title" />
                                <asp:BoundField DataField="studio" HeaderText="STUDIO" SortExpression="studio" />
                                <asp:BoundField DataField="producer" HeaderText="PRODUCER" SortExpression="producer" />
                                <asp:BoundField DataField="fname" HeaderText="ACTOR FIRST NAME" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="ACTOR LAST NAME" SortExpression="lname" />
                                <asp:BoundField DataField="datereleased" HeaderText="DATE RELEASED" SortExpression="datereleased" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select dd.dvd_id, dd.title, st.name as studio, pd.name as producer, cl.fname, cl.lname, dd.datereleased from dvd_details dd join studio st on dd.studio_id = st.studio_id join dvd_producer dp on dd.dvd_id = dp.dvd_id join producer pd on dp.producer_id= pd.producer_id join dvd_cast dc on dd.dvd_id= dc.dvd_id join cast_list cl on dc.cast_id=cl.cast_id order by cl.lname, dd.datereleased"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
