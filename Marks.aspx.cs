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
    public partial class Marks : System.Web.UI.Page
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
                GetMarks();
            }

        }

        protected void ddlClassGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGV");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClassSelected.SelectedValue + "'");
                    ddlSubjectGV.DataSource = dt;
                    ddlSubjectGV.DataTextField = "SubjectName";
                    ddlSubjectGV.DataValueField = "SubjectId";
                    ddlSubjectGV.DataBind();
                }
            }
        }
        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select  ROW_NUMBER() over(Order by(Select 1)) as [Sr.No], e.ExamId, e.ClassId, c.ClassName, e.SubjectId,
                                       s.SubjectName, e.AdmissionNo, e.Totalmarks, e.OutOfMarks from Exam e inner join Class c on e.ClassId=c.ClassId
                                        inner join Subject s on e.SubjectId=s.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
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

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId= '" + ClassId + "'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select subject");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string ClassId = ddlClass.SelectedValue;
                string SubjectId = ddlSubject.SelectedValue;
                string AdmissionNo = txtAdm.Text.Trim();
                string TotalMarks = txtTotalMarks.Text.Trim();
                string OutOfMarks = txtOutOf.Text.Trim();
                DataTable dttbl = fn.Fetch("Select StudentId from Student where ClassId = '" + ClassId +
                                          "'and AdmissionNo = '"+AdmissionNo+"' ");
                if(dttbl.Rows.Count > 0)
                {
                    DataTable dt = fn.Fetch("Select * from Exam where ClassId = '" + ClassId +
                                        "' and SubjectId='" + SubjectId + "' and AdmissionNo='" + AdmissionNo + "' ");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Exam Values('" + ClassId + "','" + SubjectId + "','" + AdmissionNo + "','" +
                                                                    TotalMarks + "','" + OutOfMarks + "')";
                        fn.Query(query);
                        lblMsg.Text = "Inserted successfully";
                        lblMsg.CssClass = "alert alert-success";
                        ddlClass.SelectedIndex = 0;
                        ddlSubject.SelectedIndex = 0;
                        txtAdm.Text = String.Empty;
                        txtTotalMarks.Text = String.Empty;
                        txtOutOf.Text = String.Empty;
                        GetMarks();
                    }
                    else
                    {
                        lblMsg.Text = "Entered <b>Data</b> already exists!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Entered Admission No<b>"+AdmissionNo+"</b> doesn't exists for selected Class!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetMarks();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetMarks();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetMarks();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int ExamId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ddlClassGV")).SelectedValue;
                string SubjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ddlSubjectGV")).SelectedValue;
                string AdmissionNo = (row.FindControl("txtAdm") as TextBox).Text.Trim();
                string TotalMarks = (row.FindControl("txtTotalmarks") as TextBox).Text.Trim();
                string OutOfMarks = (row.FindControl("txtOutOf") as TextBox).Text.Trim();
                fn.Query(@"Update Exam set ClassId = '" + ClassId + "',SubjectId='" + SubjectId + "',AdmissionNo='" + AdmissionNo + "' ," +
                           " TotalMarks= '" + TotalMarks + "',OutOfMarks= '" + OutOfMarks + "' where ExamId = '" + ExamId + "' ");
                lblMsg.Text = "Data Updated Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetMarks();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGV");
                    DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGV");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClass.SelectedValue + "'");
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectId";
                    ddlSubject.DataBind();
                    ddlClass.Items.Insert(0, "Select Subject");
                    string selectedClass = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                    ddlClass.Items.FindByText(selectedClass).Selected = true;
                }
            }
        }

    }
}