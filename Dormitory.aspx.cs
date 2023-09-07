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
    public partial class Dormitory : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GetTeacher();
                GetStudent();
                GetDormitory();
            }
        }

        private void GetStudent()
        {
            {
                DataTable dt = fn.Fetch("Select * from Student");
          
            }
        }

        private void GetDormitory()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No], DormName, DormCapacity, DormCaptain, DormPatron from Dormitory");
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }
    

        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select * from Teacher");

        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                string DormitoryName = txtDorm.Text.Trim();
                string DormitoryCapacity = txtDormCapacity.Text.Trim();
                string DormitoryCaptain = txtCaptain.Text.Trim();
                string DormitoryPatron = txtPatron.Text.Trim();
                DataTable dt = fn.Fetch("Select * from Dormitory where DormName = '" + DormitoryName + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Dormitory Values('" + DormitoryName + "','" + DormitoryCapacity + "','" + DormitoryCaptain + "','" + DormitoryPatron + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtDorm.Text = string.Empty;
                    txtDormCapacity.Text = string.Empty;
                    txtCaptain.Text = string.Empty;
                    txtPatron.Text = string.Empty;
                    GetDormitory();
                }
                else
                {
                    lblMsg.Text = "Entered Dormitory already exists";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Gridview1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridview1.PageIndex = e.NewPageIndex;
            GetDormitory();
        }

        protected void Gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            GetDormitory();
        }


        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            GetDormitory();
        }

        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = Gridview1.Rows[e.RowIndex];
                int cid = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Values[0]);
                string DormName = (row.FindControl("txtClassedit") as TextBox).Text;
                fn.Query("Update Class set ClassName='" + DormName + "' where ClassIs='" + cid + "'");
                lblMsg.Text = "Dormitory Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                Gridview1.EditIndex = -1;
                GetDormitory();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void ddlCaptain_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}