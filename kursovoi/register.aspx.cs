using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kursovoi
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.7.2.min.js",

            });
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"C:\\Users\\tkach\\source\\repos\\kursovoi\\kursovoi\\App_Data\\KursDB.accdb\"";

            var connect = new OleDbConnection(connectionString);
            connect.Open();

            string sparol, sparol_2, slogin, sname, semail;

            sparol = Convert.ToString(pass_registr.Text);
            sparol_2 = Convert.ToString(pass_repit_registr.Text);
            slogin = Convert.ToString(login_rgistr.Text);
            sname = Convert.ToString(name_registr.Text);
            semail = Convert.ToString(email_label.Text);

            string sqlQ;

            sqlQ = "INSERT INTO client(name, login, [password], [email]) VALUES('"
                + sname + "','" + slogin + "','" + sparol + "','" + semail + "')";

            if (sparol_2 == sparol)
            {
                var mycom = new OleDbCommand();
                mycom.CommandText = sqlQ;
                mycom.Connection = connect;
                mycom.ExecuteNonQuery();
                connect.Close();

                Response.Redirect("home.aspx");
            }

        }
    }
}