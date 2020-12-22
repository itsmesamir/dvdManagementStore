<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="searchDvd.aspx.cs" Inherits="databaseCoursework.SearchDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
     <form id="form1" runat="server">
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary"> Search DVD Details</h2>
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
                        <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" >
                            <Columns>
                                <asp:BoundField DataField="title" HeaderText=" DVD Title" SortExpression="title" />
                                <asp:BoundField DataField="fname" HeaderText="Actors First Name" SortExpression="lname" />
                                <asp:BoundField DataField="lname" HeaderText="Actors Last Name" SortExpression="lname" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="searchDvdTitle" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select title, cast_list.fname, cast_list.lname from dvd_details join dvd_cast on dvd_details.dvd_id= dvd_cast.dvd_id join cast_list on dvd_cast.cast_id=cast_list.cast_id where cast_list.lname='Hamal';"></asp:SqlDataSource>

                        <br />

                        <!--grid view-->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
