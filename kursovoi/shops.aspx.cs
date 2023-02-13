using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kursovoi
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AccessDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"C:\\Users\\tkach\\source\\repos\\kursovoi\\kursovoi\\App_Data\\KursDB.accdb\"";

            var connect = new OleDbConnection(connectionString);
            connect.Open();

            object up_st_ord = DropDownList1.SelectedValue;
            object up_st_st = DropDownList2.SelectedValue;


            string sqlQ_del_1 = "UPDATE [order] SET id_status = " + up_st_st + " WHERE id_order = " + up_st_ord;

            var del_1 = new OleDbCommand(sqlQ_del_1, connect);
            del_1.ExecuteNonQuery();

            connect.Close();
            label_ch_up_ord.Visible = true;


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"C:\\Users\\tkach\\source\\repos\\kursovoi\\kursovoi\\App_Data\\KursDB.accdb\"";

            var connect = new OleDbConnection(connectionString);
            connect.Open();

            object drop_op_ord = DropDownList3.SelectedValue;


            string sqlQ_del_1 = "DELETE FROM [order] WHERE (id_order=" + drop_op_ord + ")"; ;


            var del_1 = new OleDbCommand(sqlQ_del_1, connect);
            del_1.ExecuteNonQuery();

            connect.Close();
            label_del_up_ord.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}