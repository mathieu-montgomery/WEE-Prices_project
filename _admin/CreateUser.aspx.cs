using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _admin_CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList theRoles = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownList1");
            theRoles.DataSource = Roles.GetAllRoles();
            theRoles.DataBind();

            for(int i = 0; i < theRoles.Items.Count; ++i){
                if((theRoles.Items[i].Value).Equals("Student"))
                    theRoles.SelectedIndex = i;
            }

        }
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
       Roles.AddUserToRole(CreateUserWizard1.UserName, ((DropDownList)(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownList1"))).SelectedValue);    
    }
}