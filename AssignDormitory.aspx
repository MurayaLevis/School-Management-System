<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AssignDormitory.aspx.cs" Inherits="SchoolProject.Admin.AssignDormitory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Asign Dormitory</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtName">StudentName</label>
                   <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required>
                  </asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should Be In Characters!"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                   </asp:RegularExpressionValidator>

              <div class="col-md-6">
                  <label for="ddlDorm">Dormitory</label>
                  <asp:DropDownList ID="ddlDorm" runat="server" CssClass="form-control"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Dorm is required."
                     ControlToValidate="ddlDorm" Display="Dynamic" ForeColor="Red" InitialValue="Select Dorm" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
              </div>


          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Add Student" OnClick="btnAdd_Click" />
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" AllowPaging="True" PageSize="4" Width="1075px" Height="139px" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="StudentId"
                      OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                      OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:TemplateField HeaderText="StudentName">
                              <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("StudentName") %>' CssClass="form-control"
                                    Width="100px" ></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblName" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>


                           <asp:TemplateField HeaderText="Dorm">
                              <EditItemTemplate>
                                  <asp:DropDownList ID="ddlCDorm" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblDorm" runat="server" Text='<%# Eval("DormName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:CommandField>
                          <asp:TemplateField HeaderText="Class">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                      </Columns>
                      <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                  </asp:GridView>
              </div>
          </div>
            </div>
          </div>

      </div>

</asp:Content>
