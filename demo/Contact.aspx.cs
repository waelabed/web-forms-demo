﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace demo
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Contact Us";

            string user_name = "haitham";

            Session["userName"] = user_name;
        }
    }
}