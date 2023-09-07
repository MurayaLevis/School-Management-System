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
    public partial class MarksDetailsUserController : System.Web.UI.UserControl
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Admin"] == null)
            //{
           //     Response.Redirect("../Login.aspx");
           // }
            if (!IsPostBack)
            {
                GetClass();
                GetMarks();
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

        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1)) as [Sr.No], e.ExamId, e.ClassId, c.ClassName,
                                   e.SubjectId, s.SubjectName, e.AdmissionNo, e.TotalMarks, e.OutOfMarks from Exam e 
                                   inner join Class c on c.ClassId=e.ClassId inner join Subject s on s.SubjectId=e.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string ClassId = ddlClass.SelectedValue;
                string AdmissionNo = txtAdm.Text.Trim();
                DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1)) as [Sr.No], e.ExamId, e.ClassId, c.ClassName,
                                   e.SubjectId, s.SubjectName, e.AdmissionNo, e.TotalMarks, e.OutOfMarks from Exam e 
                                   inner join Class c on c.ClassId=e.ClassId inner join Subject s on s.SubjectId=e.SubjectId
                                   where e.ClassId='" + ClassId + "' and e.AdmissionNo='" + AdmissionNo + "' ");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetMarks();
        }
    }
}