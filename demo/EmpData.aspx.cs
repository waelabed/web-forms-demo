using demo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class EmpData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Request.QueryString["EmpId"] != null)
                {
                    int empId = int.Parse(Request.QueryString["EmpId"].ToString());

                }

                if (Session["EmpData"] != null)
                {
                    Employee emp = new Employee();
                    emp = (Employee)Session["EmpData"];

                    txtName.Text = emp.Name;
                    lblId.Text = emp.Id.ToString();
                }
            }
        }
    }
}