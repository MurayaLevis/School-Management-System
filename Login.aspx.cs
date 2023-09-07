using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolProject.Models.CommonFn;

namespace SchoolProject
{
    public partial class Login : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = inputEmail.Value.Trim();
            string password = InputPassword.Value.Trim();
            DataTable dt = fn.Fetch("Select * from Teacher where Email ='" + Email + "' and Password = '" + password + "' ");
            if (Email == "Admin" && password == "123")
            {
                Session["Admin"] = Email;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if (dt.Rows.Count > 0)
            {
                Session["Staff"] = Email;
                Response.Redirect("Teacher/TeacherHome.aspx");
            }
            else
            {
                lblMsg.Text = ("Login Failed!");
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }


        }
    }
}