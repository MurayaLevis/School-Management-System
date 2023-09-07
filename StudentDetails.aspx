<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="SchoolProject.Admin.StudentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Student Details</h3>

          
          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" Width="1075px" Height="139px">
                      <Columns>

                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="StudentName" HeaderText="Student Name">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="Mobile" HeaderText="Mobile">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="AdmissionNo" HeaderText="Admission No">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="ClassId" HeaderText="Class">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="Address" HeaderText="Address">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="ParentName" HeaderText="ParentName">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                      </Columns>
                      <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                  </asp:GridView>
              </div>
          </div>

      </div>
  </div>

</asp:Content>
