<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="changeAssistantPsw.aspx.cs" Inherits="databaseCoursework.ChangeAssistant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">Change My Details</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <h3 class="btn-danger"><asp:Label ID="lblError" runat="server"  Text=""></asp:Label></h3> 
                                <!--grid view-->
                                <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-info" runat="server" OnClick="LinkButton1_Click">Change Password</asp:LinkButton>
                                                <controlstyle width="100px"></controlstyle>

                                                <itemstyle wrap="False"></itemstyle>
                                            </ItemTemplate>
                                            <HeaderTemplate>Action</HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                                <!--grid view-->
                                <asp:Button ID="Button1" Style="display: none" runat="server" Text="Button" />
                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="Button1" PopupControlID="PopupWindow" BackgroundCssClass="MyPopupStyle" CancelControlID="BtnCancel" runat="server"></ajaxToolkit:ModalPopupExtender>
                                <asp:Panel ID="PopupWindow" BackColor="White" runat="server" class="rounded">
                                   
                                    <table class="table table-borderless">
                                        <tr>
                                            <th>USER<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>"></asp:SqlDataSource>
                                                &nbsp;ID</th>
                                            <td>
                                                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                             
                                        <tr>
                                            <th>PASSWORD</th>
                                            <td>
                                                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td></td>
                                            <td>
                                                <asp:Button ID="BtnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" Width="72px" OnClick="BtnUpdate_Click" keypress="" />
                                                &nbsp 

                                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="BtnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="BtnCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
