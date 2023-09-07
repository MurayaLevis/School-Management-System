<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DormitoryDetails.aspx.cs" Inherits="SchoolProject.Admin.DormitoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
       
          <h3 class="text-center">Dormitory Details</h3>


          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" Width="1075px" Height="139px">
                      <Columns>

                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="DormName" HeaderText="Dorm Name">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="DormCapacity" HeaderText="Dorm Capacity">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                           <asp:BoundField DataField="DormCaptain" HeaderText="Dorm Captain">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="DormPatron" HeaderText="Dorm Patron">
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
