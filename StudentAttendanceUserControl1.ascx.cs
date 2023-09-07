using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (Session["Admin"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
           // }
            if (!IsPostBack)
            {
                GetClass();
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

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date=Convert.ToDateTime(txtMonth.Text);

            if(ddlSubject.SelectedValue=="Select Subject")
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No], s.StudentName, sa.Status, sa.Date from StudentAttendance sa 
                             inner join Student s on s.AdmissionNo = sa.AdmissionNo where sa.ClassId='" + ddlClass.SelectedValue + "' and " +
                             "sa.AdmissionNo= '"+txtAdmissionNo.Text.Trim()+"' and DATEPART(yy,Date)='" + date.Year + "' and" +
                             " DATEPART(M,Date)='" + date.Month + "' and sa.Status = 1 ");
            }
            else
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No], s.StudentName, sa.Status, sa.Date from StudentAttendance sa 
                             inner join Student s on s.AdmissionNo = sa.AdmissionNo where sa.ClassId='" + ddlClass.SelectedValue + "' and " +
                             "sa.AdmissionNo= '" + txtAdmissionNo.Text.Trim() + "' and sa.SubjectId= '"+ddlSubject.SelectedValue+"' and " +
                             "DATEPART(yy,Date)='" + date.Year + "' and DATEPART(M,Date)='" + date.Month + "' and sa.Status = 1 ");
            }
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }
    }
}