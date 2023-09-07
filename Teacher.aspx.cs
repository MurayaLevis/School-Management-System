using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject.Admin
{
    public partial class Teacher : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e) 
        {
            //if (Session["Staff"] == null)
           // {
               // Response.Redirect("../Login.aspx");
            //}
            if (IsPostBack)
            {
                GetTeacher();
            }

        }

        private void GetTeacher()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No],[TeacherName] , PhoneNo,
                 Email, [Address], [TSCNumber],[Password] from Teacher 
");
            GridView1.DataSource=dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
               if(ddlGender.SelectedValue != "0")
                {
                    string Email = txtEmail.Text.Trim();
                    string TeacherName= txtName.Text.Trim();
                    string Gender= ddlGender.SelectedValue;
                    string PhoneNo = txtMobile.Text.Trim();
                    string Address = txtAddress.Text.Trim();
                    string Password = txtPassword.Text.Trim();
                    string TSCNo = txtTSC.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Teacher where Email = '" + Email + "' ");
                    if(dt.Rows.Count == 0)
                    {
                        string query = "Insert into Teacher values ('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', '" +
                            ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" +
                             txtPassword.Text.Trim() + "', '" + txtAddress.Text.Trim() + "', '" + txtTSC.Text.Trim() + "') ";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddlGender.SelectedIndex = 0;
                    txtName.Text = string.Empty;
                    txtDoB.Text = string.Empty;
                    txtMobile.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtAddress.Text = string.Empty;
                    txtPassword.Text = string.Empty;
                     GetTeacher();

                    }
                    else
                    {
                    lblMsg.Text = "Entered <b>'" + Email + "'</b> already exists";
                    lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacher();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacher();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeacher();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int TeacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Teacher where TeacherId = '" + TeacherId + "' ");
                lblMsg.Text = "Teacher Deleted Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetTeacher();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int TeacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string TeacherName = (row.FindControl("txtName") as TextBox).Text;
                string PhoneNo = (row.FindControl("txtMobile") as TextBox).Text;
                string Password = (row.FindControl("txtPassword") as TextBox).Text;
                string Address = (row.FindControl("txtAddress") as TextBox).Text;
                string TSCNo = (row.FindControl("txtTSC") as TextBox).Text;
                fn.Query("Update Teacher set TeacherName = '" + TeacherName.Trim() + "',Mobile='" +PhoneNo.Trim() + "',Address='" + Address.Trim()+
                    "',Password='" + Password.Trim()+ "',TSCNo='" + TSCNo.Trim()+ "' where TeacherId = '" + TeacherId + "' ");
                lblMsg.Text = "Teacher Updated Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetTeacher();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }
    }
}