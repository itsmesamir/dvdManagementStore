<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="databaseCoursework.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" runat="server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h2 class="m-0 font-weight-bold text-primary">EVL USER LIST </h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <!--grid view-->
              
                        <asp:GridView ID="staffTable" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="userDetails" Width="1000px" Height="200px" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="USER ID" ReadOnly="True" SortExpression="user_id" InsertVisible="False" />
                                <asp:BoundField DataField="fname" HeaderText="FIRST NAME" SortExpression="fname" />
                                <asp:BoundField DataField="lname" HeaderText="LAST NAME" SortExpression="lname" />
                                <asp:BoundField DataField="type" HeaderText="TYPE" SortExpression="type" />
                                <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                                <asp:BoundField DataField="password" HeaderText="PASSWORD" SortExpression="password" />
                                <asp:TemplateField HeaderText="ACTIONS" ShowHeader="False" ControlStyle-Width="100" ItemStyle-Wrap="false">
                                    <EditItemTemplate>
                                        <asp:Button ID="BtnUpdate" runat="server" CssClass="btn btn-success" CausesValidation="True" CommandName="Update" Text="Update" />

                                        &nbsp;<asp:Button ID="BtnCancel" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="BtnEdit" runat="server" CssClass="btn btn-info" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                        &nbsp;<asp:Button ID="BtnDelete" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                    </ItemTemplate>

                                    <ControlStyle Width="100px"></ControlStyle>

                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="userDetails" runat="server" ConnectionString="<%$ ConnectionStrings:DVD StudioConnectionString %>" DeleteCommand="DELETE FROM [user_sys] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [user_sys] ([fname], [lname], [type], [email], [password]) VALUES (@fname, @lname, @type, @email, @password)" SelectCommand="SELECT * FROM [user_sys]" UpdateCommand="UPDATE [user_sys] SET [fname] = @fname, [lname] = @lname, [type] = @type, [email] = @email, [password] = @password WHERE [user_id] = @user_id">
                            <DeleteParameters>
                                <asp:Parameter Name="user_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="fname" Type="String" />
                                <asp:Parameter Name="lname" Type="String" />
                                <asp:Parameter Name="type" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="fname" Type="String" />
                                <asp:Parameter Name="lname" Type="String" />
                                <asp:Parameter Name="type" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="password" Type="String" />
                                <asp:Parameter Name="user_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    <!--form view-->
                    <asp:FormView ID="UserView" runat="server" DataSourceID="userDetails" Height="26px">
                     <InsertItemTemplate>
                                FIRST NAME:
                                <asp:TextBox ID="FirstNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("fname") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox" ForeColor="Red" runat="server" ErrorMessage="please enter First Name"></asp:RequiredFieldValidator>
                                <br />
                                LAST NAME:
                                <asp:TextBox ID="LastNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("lname") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox" ForeColor="Red" runat="server" ErrorMessage="please enter Last Name"></asp:RequiredFieldValidator>
                                <br />                
                                TYPE:
                                <asp:TextBox ID="TypeTextBox" CssClass="form-control" runat="server" Text='<%# Bind("type") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TypeTextBox" ForeColor="Red" runat="server" ErrorMessage="please enter user type"></asp:RequiredFieldValidator>
                                <br />
                                EMAIL:
                                <asp:TextBox ID="emailTextBox" CssClass="form-control" runat="server" Text='<%# Bind("email") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="emailTextBox" ForeColor="Red" runat="server" ErrorMessage="please enter email"></asp:RequiredFieldValidator>
                                <br />
                                PASSWORD:
                                <asp:TextBox ID="passwordTextBox" CssClass="form-control" runat="server" Text='<%# Bind("password") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="passwordTextBox" ForeColor="Red" runat="server" ErrorMessage="please select Password"></asp:RequiredFieldValidator>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                <asp:LinkButton ID="InsertButton" CssClass="btn btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Add User" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <% if (Session["type"].ToString().ToLower() == "manager") { %> <asp:LinkButton ID="AddNewButton" CssClass="btn btn-success" runat="server" CausesValidation="False" CommandName="New" Text=" Add New User" />
                                <% } %>
                                &nbsp;
                            </ItemTemplate>
                    </asp:FormView>
                    <br />
                    <!--form view-->
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </form>
</asp:Content>
