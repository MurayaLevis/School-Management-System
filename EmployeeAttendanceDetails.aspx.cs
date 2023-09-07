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
    public partial class EmployeeAttendanceDetails : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeacher();
            }
        }

        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select * from Teacher");
            ddlName.DataSource = dt;
            ddlName.DataTextField = "TeacherName";
            ddlName.DataValueField = "TeacherId";
            ddlName.DataBind();
            ddlName.Items.Insert(0, "Select Teacher");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date = Convert.ToDateTime(txtMonth.Text);

            if (ddlName.SelectedValue == "Select Teacher")
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No],t.TeacherName, ta.Status, ta.Date from TeacherAttendance ta 
                          inner join Teacher t on t.TeacherId = ta.TeacherId  and DATEPART(yy,Date)='" + date.Year + "' and" +
                             " DATEPART(M,Date)='" + date.Month + "' and ta.Status = 1 ");
            }
            else
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [Sr.No],t.TeacherName, ta.Status, ta.Date from TeacherAttendance ta 
                          inner join Teacher t on t.TeacherId = ta.TeacherId  and DATEPART(yy,Date)='" + date.Year + "' and" +
                             " DATEPART(M,Date)='" + date.Month + "' and ta.Status = 1 ");
            }
            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }
    }
}