using demo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                int x = 10;
                int y = 20;

                int result = y + x;

                //txtResult.Text = result.ToString();

                // bind data from database
                grdEmp.DataSource = getEmpList();
                grdEmp.DataBind();
                
            }

        }

        private List<Employee> getEmpList()
        {
            var empList = new List<Employee>()
            {
                new Employee {CreationDate = DateTime.Now, Id = 1, Name = "haitham", Salary=1000},
                new Employee {CreationDate = DateTime.Now, Id = 2, Name = "Wael", Salary=1003}
            };

            return empList;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Data Saved!";
        }

        


        protected void grdEmp_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get id for the current row
            Label lblId = (Label)grdEmp.Rows[e.RowIndex].FindControl("lblColId");

            // Delete from database


            var empList = getEmpList();

            var empItem = empList.Where(emp => emp.Id == int.Parse(lblId.Text)).FirstOrDefault();

            empList.Remove(empItem);

            // re bind (grid) = datasource
            grdEmp.DataSource = empList;
            grdEmp.DataBind();

            lblMessage.Text = "Data Deleted";

        }

        protected void grdEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get id for the current row
            Label lbl_id = (Label)grdEmp.Rows[e.RowIndex].FindControl("lblColId");

            // Get emp name from the current row.
            Label lblName = (Label)grdEmp.Rows[e.RowIndex].FindControl("lblColName");

            // Get salary from the current row, but its the dirty way you can use template field instead.
            decimal salary = decimal.Parse(grdEmp.Rows[e.RowIndex].Cells[2].Text);


            txtName.Text = lblName.Text;
            txtSalary.Text = salary.ToString();
            lblId.Text = lbl_id.Text;
        }

        protected void grdEmp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "UpdateStatus")
            {
                int id = int.Parse(e.CommandArgument.ToString());

            }
            else if(e.CommandName== "UpdateHistoryStatus")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                // Get Emp Name value
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);



                Label lbl_Name = (Label)grdEmp.Rows[row.RowIndex].FindControl("lblColName");

                txtName.Text = lbl_Name.Text;

                int _id = (int)grdEmp.DataKeys[row.RowIndex].Value;

                lblId.Text = _id.ToString();

                Employee emp = new Employee
                {
                    Id = _id,
                    Name = lbl_Name.Text
                };

                Session["EmpData"] = emp;

                Response.Redirect($"~/EmpData.aspx?EmpId={emp.Id}");

            }

            
        }
    }
}