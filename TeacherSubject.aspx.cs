using SchoolProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject.Admin
{
    public partial class TeacherSubject : System.Web.UI.Page
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
                GetTeacher();
                GetTeacherSubject();
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
        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select * from Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "TeacherName";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "Select subject");
        }

        private void GetTeacherSubject()
        {
            DataTable dt = fn.Fetch(@"Select  ROW_NUMBER() over(Order by(Select 1)) as [Sr.No],ts.Id, ts.ClassId, c.ClassName, ts.SubjectId,
                                      s.SubjectName, ts.TeacherId, t.TeacherName from TeacherSubject ts inner join
                                      Class c on ts.ClassId= c.ClassId inner join Subject s on ts.SubjectId= s.SubjectId inner join
                                      Teacher t on ts.TeacherId = t.TeacherId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId= '"+ ClassId+"'");
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
                string TeacherId = ddlTeacher.SelectedValue;
                DataTable dt = fn.Fetch("Select * from TeacherSubject where ClassId = '" + ClassId+
                    "' and SubjectId='" + SubjectId+ "' or TeacherId='"+TeacherId+"' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into TeacherSubject Values('" + ClassId+ "','" +SubjectId+ "','"+TeacherId+"')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted successfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    ddlTeacher.SelectedIndex = 0;
                    GetTeacherSubject();
                }
                else
                {
                    lblMsg.Text = "Entered <b>Teacher</b> already exists!";
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
            GridView1.EditIndex = e.NewPageIndex;
            GetTeacherSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeacherSubject();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeacherSubject();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int TeacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ddlClassGV")).SelectedValue;
                string SubjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ddlSubjectGV")).SelectedValue;
                string TeacherId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("ddlTeacherGV")).SelectedValue;
                string SubjectName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query(@"Update TeacherSubject set ClassId = '" + ClassId + "',SubjectId='" + SubjectId + "',TeacherId='"+ TeacherId+"'" +
                    " where Id = '" + TeacherSubjectId + "' ");
                lblMsg.Text = "Data Updated Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetTeacherSubject();
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
                int TeacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where TeacherSubjectId = '" + TeacherSubjectId + "' ");
                lblMsg.Text = "Teacher Deleted Successfully!";
                lblMsg.CssClass = "alert alert-Success";
                GridView1.EditIndex = -1;
                GetTeacherSubject();
            }
            catch (Exception ex)
            {
                Response.Write("< Script > alert('" + ex.Message + "'));</Script>");
            }
        }

        protected void ddlClassGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected=(DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if(row!= null)
            {
                if((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGV");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ddlClassSelected.SelectedValue + "'");
                    ddlSubjectGV.DataSource=dt;
                    ddlSubjectGV.DataTextField = "SubjectName";
                    ddlSubjectGV.DataValueField = "SubjectId";
                    ddlSubjectGV.DataBind();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                if((e.Row.RowState & DataControlRowState.Edit) > 0)
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