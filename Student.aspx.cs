using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject.Admin
{
    public partial class Student : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                GetClass();
                GetStudent(); 
              
            }
        }

      
        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string AdmissionNo = txtAdm.Text.Trim();
                    string StudentName = txtName.Text.Trim();
                    string DOB = txtDoB.Text.Trim();    
                    string Gender = ddlGender.SelectedValue;
                    string PhoneNo = txtMobile.Text.Trim();
                    string Address = txtAddress.Text.Trim();
                    string ParentName = txtParent.Text.Trim();
                    string Class = ddlClass.SelectedValue;
                    DataTable dt = fn.Fetch("Select * from Student where AdmissionNo='"+AdmissionNo+"'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Student values ('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "', '" +
                            ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "', '" + txtAdm.Text.Trim() + "', '" +
                            txtAddress.Text.Trim() + "','" + txtParent.Text.Trim() + "' ,'" + ddlClass.SelectedValue + "') ";
                        fn.Query(query);
                        lblMsg.Text = "Inserted successfully";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtAdm.Text = string.Empty;
                        txtAddress.Text = string.Empty;
                        txtParent.Text = string.Empty;
                        ddlClass.SelectedIndex = 0;
                        GetStudent();

                    }
                    else
                    {
                        lblMsg.Text = "Entered Admission No <b>'" +AdmissionNo+ "'</b> already exists";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetStudent()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No], s.[StudentName],
                                     s.Mobile, s.AdmissionNo, s.[Address],s.ParentName, c.ClassName from Student s 
									 inner join Class c on c.ClassId = s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex=e.NewPageIndex;
            GetStudent();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetStudent();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex=e.NewEditIndex;
            GetStudent();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int StudentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string StudentName = (row.FindControl("txtName") as TextBox).Text;
                string PhoneNo = (row.FindControl("txtMobile") as TextBox).Text;
                string AdmissionNo = (row.FindControl("txtAdm") as TextBox).Text;
                string Address= (row.FindControl("txtAddress") as TextBox).Text;
                string ParentName = (row.FindControl("txtParent") as TextBox).Text;
                string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("ddlClass")).SelectedValue;
                string DormId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[5].FindControl("ddDorm")).SelectedValue;
                string DOB = (row.FindControl("txtDOB") as TextBox).Text;
                fn.Query("Update Student set StudentName = '" + StudentName.Trim() + "',Mobile='" + PhoneNo.Trim() + "',Address='" + Address.Trim() +
                    "' ParentName='" +ParentName+"',AdmissionNo='" + AdmissionNo.Trim() + "',ClassId='" + ClassId + "',DormId='" +DormId + "'where StudentId = '" + StudentId + "' ");
                lblMsg.Text = "Student Updated Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetStudent();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                int StudentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Student where StudentId = '" +StudentId + "' ");
                lblMsg.Text = "Student Deleted Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetStudent();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
               
                DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGV");
                DataTable dt = fn.Fetch("Select * from Class");
                ddlClass.DataSource = dt;
                ddlClass.DataTextField = "ClassName";
                ddlClass.DataValueField = "ClassId";
                ddlClass.DataBind();
                ddlClass.Items.Insert(0, "Select Class");
                string selectedClass=DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
                ddlClass.Items.FindByText(selectedClass).Selected=true;
                
            }
        }
    }
}