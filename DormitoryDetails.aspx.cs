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
    public partial class DormitoryDetails : System.Web.UI.Page
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
                GetDormitoryDetails();
            }
        }

        private void GetDormitoryDetails()
        {
            DataTable dt = fn.Fetch(@"Select  ROW_NUMBER() over(Order by(Select 1)) as [Sr.No], DormName,DormCapacity,Dormcaptain,DormPatron from Dormitory");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}