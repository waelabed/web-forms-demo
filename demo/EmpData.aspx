<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpData.aspx.cs" Inherits="demo.EmpData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
            <asp:Button ID="btnSave"  runat="server" Text="Save" />
            <asp:Label ID="lblMessage" style="font-size:32px"  CssClass="text-danger bold" runat="server" Text="" />
        </div>

     </div>

</asp:Content>
