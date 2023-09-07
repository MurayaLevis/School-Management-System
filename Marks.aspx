<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SchoolProject.Admin.Marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed"/>
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Add Marks</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                            <div class="col-md-6">
                  <label for="ddlClass">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required."
                     ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
              </div>
              <div class="col-md-6">
                  <label for="ddlSubject">Subject</label>
                  <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" AutoPostBack="true"  ></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required."
                     ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
               </div>
               <div class="col-md-12 mt-2">
                  <label for="txtAdm">Admission No</label>
                   <asp:TextBox ID="txtAdm" runat="server" CssClass="form-control" placeholder="Enter Admission No" 
                     required></asp:TextBox>
               </div>

               <div class="col-md-6 mt-2">
                  <label for="txtTotalMarks">TotalMarks</label>
                   <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="form-control" placeholder="Enter Total Marks" 
                       TextMode="Number" required></asp:TextBox>
               </div>

                <div class="col-md-6 mt-2">
                  <label for="txtOutOf">OutOfMarks</label>
                   <asp:TextBox ID="txtOutOf" runat="server" CssClass="form-control" placeholder="Enter Out Of Marks" 
                       TextMode="Number" required></asp:TextBox>
               </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Add Marks"
                  OnClick="btnAdd_Click"/>
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-6">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" AllowPaging="True" PageSize="4" Width="1075px" Height="139px" OnPageIndexChanging="GridView1_PageIndexChanging" 
                      DataKeyNames="ExamId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                      OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:TemplateField HeaderText="Class">
                              <EditItemTemplate>
                                  <asp:DropDownList ID="ddlClassGV" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                      DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassGV_SelectedIndexChanged">
                                      <asp:ListItem>Select Class</asp:ListItem>
                                  </asp:DropDownList>
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                                      SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Subject">
                              <EditItemTemplate>
                                  <asp:DropDownList ID="ddlSubjectGV" runat="server" CssClass="form-control" SelectedValue='<%# Eval("SubjectId") %>'>
                                      <asp:ListItem>Select Subject</asp:ListItem>
                                  </asp:DropDownList>
                              </EditItemTemplate> 
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Admission No">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtAdm" runat="server" CssClass="form-control" Text='<%# Eval("AdmissionNo") %>' 
                                      ></asp:TextBox>  
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("AdmissionNo") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                             <asp:TemplateField HeaderText="Total Marks">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="form-control" Text='<%# Eval("TotalMarks") %>' 
                                      ></asp:TextBox>  
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("TotalMarks") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                             <asp:TemplateField HeaderText="Out Of marks">
                              <EditItemTemplate>
                                  <asp:TextBox ID="txtOutOf" runat="server" CssClass="form-control" Text='<%# Eval("OutOfMarks") %>' 
                                      ></asp:TextBox>  
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label3" runat="server" Text='<%# Eval("OutOfMarks") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>

                          <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
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
