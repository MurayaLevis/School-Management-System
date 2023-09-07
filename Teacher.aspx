﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolProject.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Add Teacher</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtName">Name</label>
                   <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required>
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
                  <label for="txtMobile">Phone No</label>
                  <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required>
                  </asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone No!"
                       ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                   </asp:RegularExpressionValidator>
              </div>
          </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtEmail">Email</label>
                   <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode ="Email" required>
                  </asp:TextBox>
                  
              </div>
              <div class="col-md-6">
                  <label for="txtPassword">Password</label>
                  <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" required>
                  </asp:TextBox>
              </div>
          </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-6">
                  <label for="txtAddress">Address</label>
                   <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode ="MultiLine" required>
                  </asp:TextBox>
                  
              </div>
              <div class="col-md-6">
                  <label for="txtTSC">TSC No</label>
                  <asp:TextBox ID="txtTSC" runat="server" CssClass="form-control" placeholder="Enter TSC No" TextMode ="Number" required>
                  </asp:TextBox>
              </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Add Teacher" OnClick="btnAdd_Click" />
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="1075px" Height="139px" OnPageIndexChanging="GridView1_PageIndexChanging"
                      OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                      OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:TemplateField HeaderText="Teacher Name">
                              <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("TeacherName") %>' CssClass="form-control"
                                    Width="100px" ></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblName" runat="server" Text='<%# Eval("TeacherName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Mobile">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("PhoneNo") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Email">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                           <asp:TemplateField HeaderText="Password">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
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

                          <asp:TemplateField HeaderText="TSC No">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtTSC" runat="server" Text='<%# Eval("TSCNumber") %>' CssClass="form-control"
                                       Width="100px"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblTSC" runat="server" Text='<%# Eval("TSCNumber") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:CommandField>
                      </Columns>
                      <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                  </asp:GridView>
              </div>
          </div>

      </div>
    </div>

</asp:Content>
