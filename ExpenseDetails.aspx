<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ExpenseDetails.aspx.cs" Inherits="SchoolProject.Admin.ExpenseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function ()){
            $('#<%=GridView1.ClientID%>').prepend($("<thread></thread>").append($(this).find("tr:first"))).DataTable({ "paging": true, "ordering": true, "searching": true })
        };
    </script>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url('../Images/education-management-1.jpg');width:100%; height:696px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
       
          <h3 class="text-center">Expense Details</h3>


          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-10">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display!"
                      AutoGenerateColumns="False" Width="1075px" Height="139px">
                      <Columns>

                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="ClassName" HeaderText="Class">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="ChargedAmount" HeaderText="ChargedAmount">
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
