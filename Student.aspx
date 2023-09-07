<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolProject.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Add Student</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtName">StudentName</label>
                   <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required="">
                  </asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should Be In Characters!"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                   </asp:RegularExpressionValidator>
              </div>
              <div class="col-md-6">
                  <label for="txtDoB">Date of Birth</label>
                  <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required>
                  </asp:TextBox>
              </div>
          </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="ddlGender">Gender</label>
                   <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                       <asp:ListItem Value="0">Select Gender</asp:ListItem>
                       <asp:ListItem>Male</asp:ListItem>
                       <asp:ListItem>Female</asp:ListItem>
                       <asp:ListItem>Prefer Not to say</asp:ListItem>
                   </asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is Required"
                       forecolor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                   </asp:RequiredFieldValidator>
              </div>
              <div class="col-md-6">
                  <label for="txtMobile">Contact No</label>
                  <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required>
                  </asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone No!"
                       ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                   </asp:RegularExpressionValidator>
              </div>
          </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtAdm">AdmissionNo</label>
                   <asp:TextBox ID="txtAdm" runat="server" CssClass="form-control" placeholder="Enter Admission" TextMode ="Number" required>
                  </asp:TextBox>
               </div>
             </div>

              <div class="col-md-6">
                  <label for="ddlClass">Class</label>
                  <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is required."
                     ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
              </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtAddress">Address</label>
                   <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode ="MultiLine" required>
                  </asp:TextBox>
             
               <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtParent">ParentName</label>
                   <asp:TextBox ID="txtParent" runat="server" CssClass="form-control" placeholder="Enter ParentName" required>
                  </asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Name Should Be In Characters!"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtParent">
                   </asp:RegularExpressionValidator>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Add Student" OnClick="btnAdd_Click" />
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" AllowPaging="True" PageSize="4" Width="1075px" Height="139px" OnPageIndexChanging="GridView1_PageIndexChanging"
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

                          <asp:TemplateField HeaderText="Mobile">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="AdmissionNo">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtAdm" runat="server" Text='<%# Eval("AdmissionNo") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblAdm" runat="server" Text='<%# Eval("AdmissionNo") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Class">
                              <EditItemTemplate>
                                  <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblClass" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Address">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="ParentName">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtParent" runat="server" Text='<%# Eval("ParentName") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblParent" runat="server" Text='<%# Eval("ParentName") %>'></asp:Label>
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
    </div>

</asp:Content>
