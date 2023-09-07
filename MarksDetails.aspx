<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MarksDetails.aspx.cs" Inherits="SchoolProject.Admin.MarkDetails" %>

<%@ Register Src="~/MarksDetailsUserController.ascx" TagPrefix="uc" TagName="MarkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:720px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Mark Details</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                            <div class="col-md-6">
                  <label for="ddlClass">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required."
                     ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"> </asp:RequiredFieldValidator>
              </div>
              <div class="col-md-6">
                  <label for="txtAdm">AdmissionNo</label>
                  <asp:TextBox ID="txtAdm" runat="server" CssClass="form-control" placeholder="Enter Admission No" required> </asp:TextBox>
              </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Get Marks" />
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" AllowPaging="true" PageSize="4" Width="1004px" Height="152px" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="ExamId">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" >
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="ClassName" HeaderText="Class">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          
                          <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          
                          <asp:BoundField DataField="AdmissionNo" HeaderText="AdmissionNo">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          
                          <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          
                          <asp:BoundField DataField="OutOfMarks" HeaderText="Out Of Marks">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                      </Columns>
                  </asp:GridView>
              </div>
          </div>
      </div>
  </div>

    <uc:MarkDetails runat="server" ID="MarksDetail1" />

</asp:Content>
