<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="demo._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
               
               <asp:Label CssClass="control-label" Text="Id" runat="server" />

               <div class="col-md-10">
                    <asp:Label runat="server" id="lblId" CssClass="form-cotrol" />
               </div>
               
           </div>

           <div class="form-group">
               
               <asp:Label CssClass="control-label" Text="Name" runat="server" />

               <div class="col-md-10">
                    <asp:TextBox runat="server" id="txtName" CssClass="form-cotrol" />
               </div>
               
           </div>

            <div class="form-group">
               
               <asp:Label CssClass="control-label" Text="Salary " runat="server" />

               <div class="col-md-10">
                    <asp:TextBox runat="server" id="txtSalary" CssClass="form-cotrol" />
               </div>
                
           </div>

            
        </div>

        <div class="col-md-3">
            <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Save" />
            <asp:Label ID="lblMessage" style="font-size:32px"  CssClass="text-danger bold" runat="server" Text="" />
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView Width="100%" AutoGenerateColumns="false" ID="grdEmp" runat="server" OnRowDeleting="grdEmp_RowDeleting" OnRowUpdating="grdEmp_RowUpdating" OnRowCommand="grdEmp_RowCommand" DataKeyNames="Id" >

                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblColId" Text='<%#Eval("Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <asp:Label ID="lblColName" Text='<%#Eval("Name") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtColName" Text='<%#Bind("Name") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Salary" HeaderText="Salary">
                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="CreationDate" HeaderText="Creation Date">
                        <ItemStyle Width="70px"></ItemStyle>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button OnClientClick="return confirm('Are you sure!')" CommandName="Delete" Text="Delete" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button Text="Edit" CommandName="Update" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Options">
                        <ItemTemplate>
                            <asp:Button Text="UpdateStatus" CommandName="UpdateStatus" CommandArgument='<%#Eval("Id") %>' runat="server" />

                            <asp:Button Text="UpdateHistoryStatus" CommandName="UpdateHistoryStatus" CommandArgument='<%#Eval("Id") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink NavigateUrl='<%#Eval("Id", "~/EmpData.aspx?EmpId={0}")%>' Text="Edit" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

    </div>

</asp:Content>
