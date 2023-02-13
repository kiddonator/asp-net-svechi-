using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kursovoi
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button13_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int IDU;
            IDU = Convert.ToInt32(Session["IDU"]);
            Console.WriteLine(IDU);
            if (IDU == 0)
            {
                error_new_order.Visible = true;
            }
            else
            {
                error_new_order.Visible = false;

                string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"C:\\Users\\tkach\\source\\repos\\kursovoi\\kursovoi\\App_Data\\KursDB.accdb\"";
                var connect = new OleDbConnection(connectionString);
                connect.Open();


                string sqlQ;
                sqlQ = "INSERT INTO  [order] (id_client, id_status, id_svechi) VALUES('"
                   + IDU + "','" + 1 + "','" + DropDownList1.SelectedValue + "')";

                var bd = new OleDbCommand(sqlQ, connect);
                bd.ExecuteNonQuery();



                connect.Close();

                Response.Redirect("home.aspx");

            }
            

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}