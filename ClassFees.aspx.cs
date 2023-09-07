﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject.Admin
{
    public partial class ClassFees : System.Web.UI.Page
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
                GetFees();
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
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Fees where ClassId = '" + ddlClass.SelectedItem.Value+ "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Fees Values( where ClassId ='"+ddlClass.SelectedItem.Value+"' and FeesAmount = '" + txtFeeAmounts.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex=0;
                    txtFeeAmounts.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Entered Fees already exists for <b>'"+classVal+"'</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetFees()
        {
            DataTable dt = fn.Fetch(@"select Row_Number() over(Order by (Select 1)) as [Sr.No],f.FeesId, f.ClassId, c.ClassName,
                                    f.FeesAmount from Fees f inner join Class c on c.ClassId=f.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetFees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int FeesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where FeesId = '" + FeesId + "' ");
                lblMsg.Text = "Fees Deleted Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch(Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = -e.NewEditIndex;
            GetFees();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int FeesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string FeesAmount=(row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount= '" + FeesAmount.Trim() + "' where FeesId = '" + FeesId + "' ");
                lblMsg.Text = "Fees Updated Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex=-1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {

        }
    }
}