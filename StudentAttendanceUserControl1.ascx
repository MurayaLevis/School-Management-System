<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUserControl1.ascx.cs" Inherits="SchoolProject.WebUserControl1" %>


<div style="background-image:url('../Images/education-management-1.jpg');width:214%; height:703px; background-repeat:no-repeat;background-size:cover; background-attachment:fixed">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server"></asp:Label>
          </div>
          <h3 class="text-center">Student Attendance Details</h3>

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
                 <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required."
                     ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>--%>
               </div>
             </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
             <div class="col-md-6">
                  <label for="txtAdmissionNo">Admission No</label>
                 <asp:TextBox ID="txtAdmissionNo" runat="server" CssClass="form-control" Placeholder="Enter Admission No"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="AdmissionNo is required."
                     ControlToValidate="txtAdmissionNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
              </div>
              <div class="col-md-6">
                  <label for="txtMonth">Month</label>
                  <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is required."
                     ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                 </asp:RequiredFieldValidator>
               </div>
             </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9" Text="Check Attendance"
                  OnClick="btnCheckAttendance_Click"/>
            </div>
          </div>

          <div class="row mb-3 mr-lg-5 ml-lg-5">
              <div class="col-md-12">
                  <asp:GridView ID="Gridview1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to Display!" Height="162px" Width="955px" AutoGenerateColumns="false" >
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" >
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                          <asp:BoundField DataField="StudentName" HeaderText="Student Name" >
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                          <asp:BoundField DataField="Status" HeaderText="Status" >
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:BoundField>
                          <asp:TemplateField HeaderText="Status">
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Boolean.Parse(Eval("status").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd:MMMM:yyyy}" >
                              <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                      </Columns>
                      <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                  </asp:GridView>
              </div>
          </div>

      </div>
 </div>