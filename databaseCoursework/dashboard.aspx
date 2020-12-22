<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="databaseCoursework.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Content Row -->
            <div class="row">

                <!-- Show Total Number of Packages -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-lg font-weight-bold text-primary text-uppercase mb-1">Total DVDs</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <asp:Label ID="DVDcount" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-compact-disc fa-3x">
                                    <asp:SqlDataSource ID="getDVDcount" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select count(*) from DVD_details"></asp:SqlDataSource>
                                    </i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Show total  Desinations -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-lg font-weight-bold text-success text-uppercase mb-1">Total Loans</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <asp:Label ID="LoanCount" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-money-bill-alt fa-3x">
                                    <asp:SqlDataSource ID="getLoanCount" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select count(*) from loans"></asp:SqlDataSource>
                                    </i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Show total number of customers -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-lg font-weight-bold text-info text-uppercase mb-1">Total Members</div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                                <asp:Label ID="MemberCount" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-users fa-3x">
                                    <asp:SqlDataSource ID="getMemberCount" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select count(*) from member_details"></asp:SqlDataSource>
                                    </i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Show total registered staffs-->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-lg font-weight-bold text-warning text-uppercase mb-1">Registered Users</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <asp:Label ID="StaffCount" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fa fa-user-secret fa-3x">
                                    <asp:SqlDataSource ID="getStaffCount" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select count(*) from user_sys"></asp:SqlDataSource>
                                    </i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Row -->

            <div class="row">

                <!-- Area Chart -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card shadow">
                        <!-- Chart to show packaes booking-->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary"> DVDs on Loan</h6>

                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="chart-bar mb-1">
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" BackColor="DodgerBlue" Height="319px" Width="673px">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="title" YValueMembers="totalLoans" Legend="Legend1" YValuesPerPoint="2">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="Legend1" Title="total customers">
                                        </asp:Legend>
                                    </Legends>
                                </asp:Chart>

                                <br />
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="SELECT dvd_details.title, COUNT(member_num) AS totalLoans FROM loans join dvd_details on dvd_details.dvd_id=loans.dvd_id GROUP BY title"></asp:SqlDataSource>

                            </div>

                        </div>
                    </div>
                </div>

                <!-- Pie Chart -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card shadow mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">DVD Category</h6>

                        </div>
                        <!-- Package Difficulty Indicator-->
                        <div class="card-body">
                            <div class="chart-pie pt-6 pb-4 mt-5">
                                <asp:Chart runat="server" ID="ctl00" Height="232px" Palette="Pastel" Width="340px" DataSourceID="SqlDataSource2">
                                    <Series>
                                        <asp:Series Name="Series1" ChartType="Pie" IsValueShownAsLabel="True" Legend="Packages" XValueMember="name" YValueMembers="Column1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="Packages">
                                        </asp:Legend>
                                    </Legends>
                                </asp:Chart>

                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" SelectCommand="select  dvd_category.name, count(*) from  dvd_details join dvd_category on dvd_details.category_id = dvd_category.dvd_category_id group by name"></asp:SqlDataSource>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
    </form>
</asp:Content>
