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
    public partial class ClassDetails : System.Web.UI.Page
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
                GetExpenseDetails();
            }
        }

        private void GetExpenseDetails()
        {
            DataTable dt = fn.Fetch(@"Select  ROW_NUMBER() over(Order by(Select 1)) as [Sr.No], ClassName from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}