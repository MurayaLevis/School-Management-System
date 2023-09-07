<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dormitory.aspx.cs" Inherits="SchoolProject.Admin.Dormitory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div style="background-image:url('../Images/education-management-1.jpg');width:214%; height:703px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">New Dormitory</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                  <label for="txtDorm">Dormitory Name</label>
                  <asp:TextBox ID="txtDorm" runat="server" CssClass="form-control" placeholder="Enter Dormitory Name" required=""></asp:TextBox>
              </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                  <label for="txtDormCapacity">Dormitory Capacity</label>
                  <asp:TextBox ID="txtDormCapacity" runat="server" CssClass="form-control" placeholder="Enter Dormitory Capacity" TextMode="Number" required=""></asp:TextBox>
              </div>
          </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                <label for="txtCaptain">Captain</label>
                <asp:TextBox ID="txtCaptain" runat="server" CssClass="form-control" placeholder="Enter Dormitory Captain" required=""></asp:TextBox>
              </div>
          </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                <label for="txtPatron">Patron</label>
                <asp:TextBox ID="txtPatron" runat="server" CssClass="form-control" placeholder="Enter Dormitory Patron" required=""></asp:TextBox>
          </div>
         </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                  <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Add Dormitory" OnClick="btnAdd_Click1"></asp:Button>
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-6">
                  <asp:GridView ID="Gridview1" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False"
                      EmptyDataText="No Record to Display!" OnPageIndexChanging="Gridview1_PageIndexChanging" OnRowCancelingEdit="Gridview1_RowCancelingEdit" 
                      OnRowEditing="Gridview1_RowEditing" OnRowUpdating="Gridview1_RowUpdating" Height="16px" Width="1314px" AllowPaging="true" PageSize="10">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="Dormitory Name">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtDormName" runat="server" Text='<%# Eval("DormName") %>' CssClass="form-control"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblDormName" runat="server" Text='<%# Eval("DormName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                             <asp:TemplateField HeaderText="Dormitory Captain">
                              <EditItemTemplate>
                                 <asp:TextBox ID="txtCaptain" runat="server" Text='<%# Eval("DormCaptain") %>' CssClass="form-control"></asp:TextBox>
                                 </EditItemTemplate>
                                <ItemTemplate>
                                  <asp:Label ID="lblCaptain" runat="server" Text='<%# Eval("DormCaptain") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                            <asp:TemplateField HeaderText="Dormitory Patron">
                              <EditItemTemplate>
                                 <asp:TextBox ID="txtPatron" runat="server" Text='<%# Eval("DormPatron") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                  <asp:Label ID="txtPatron" runat="server" Text='<%# Eval("Dormpatron") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Dormitory Capacity">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtDormCapacity" runat="server" Text='<%# Eval("DormCapacity") %>' CssClass="form-control"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblDormName" runat="server" Text='<%# Eval("DormCapacity") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                          <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
                      </Columns>
                  </asp:GridView>
              </div>
          </div>
      </div>
  </div>

</asp:Content>
