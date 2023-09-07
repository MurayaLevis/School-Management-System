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
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn=new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if(!IsPostBack)
            {
                GetClass();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (select 1)) as [Sr.No],ClassId,ClassName from Class");
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName = '" + txtclass.Text.Trim() + "' ");
                if(dt.Rows.Count == 0)
                {
                    string query = "Insert into Class Values('" + txtclass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtclass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Entered Class already exists";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Gridview1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           Gridview1.PageIndex=e.NewPageIndex;
            GetClass();
        }

        protected void Gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            GetClass();
        }


        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex=e.NewEditIndex;
        }

        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = Gridview1.Rows[e.RowIndex];
                int cid = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Values[0]);
                string ClassName= (row.FindControl("txtClassedit") as TextBox).Text;
                fn.Query("Update Class set ClassName='" + ClassName + "' where ClassIs='" + cid + "'");
                lblMsg.Text = "Class Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                Gridview1.EditIndex=-1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Class where ClassName = '" + txtclass.Text.Trim() + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class Values('" + txtclass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtclass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Entered Class already exists";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}