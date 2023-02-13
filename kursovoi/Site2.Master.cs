using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kursovoi
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
       
            protected void registr_signin_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_out_Click(object sender, EventArgs e)
        {
            btn_out.Visible = true;
            Session.Clear();
            login_avt.Visible = true;
            pass_avt.Visible = true;
            btn_out.Visible = false;
            Button2.Visible = true;
            Button1.Visible = true;
            
            Label2.Visible = true;
            Label3.Visible = true;

            Label1.Visible = false;
            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"C:\\Users\\tkach\\source\\repos\\kursovoi\\kursovoi\\App_Data\\KursDB.accdb\"";

            var connect = new OleDbConnection(connectionString);
            connect.Open();

            string sparol, slogin;
            sparol = Convert.ToString(pass_avt.Text);
            slogin = Convert.ToString(login_avt.Text);


            string sqlQ = "SELECT * FROM client WHERE login='" + slogin + "'AND password='" + sparol + "'";

            var mycom = new OleDbCommand(sqlQ, connect);


            OleDbDataReader myread;
            myread = mycom.ExecuteReader();

            if (myread.Read() == true)
            {
                Session["IDU"] = myread["id_client"];
                Session["IDN"] = myread["name"];
                Session["ID_ST"] = myread["status_clienta"];
                Session["IDP"] = Convert.ToString(myread.GetValue(0));
                login_avt.Visible = false;
                pass_avt.Visible = false;
                Button1.Visible = false;
                btn_out.Visible = true;
                Label2.Visible = false;
                Label3.Visible = false;
                Button2.Visible = false;
                Label1.Visible = true;
                Label1.Text = "Привет " + myread["name"] + "!";

                string str = "admin";
                string str_2 = "worker";
                object obj = myread["status_clienta"];
                bool result_2 = str_2.Equals(obj);

                bool result = str.Equals(obj);



              


            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Введены некорректные данные!";
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            long iduser = Convert.ToInt64(Session["IDU"]);
            string myuser = Convert.ToString(Session["IDN"]);
            object stat = Convert.ToString(Session["ID_ST"]);

            string str = "admin";

            
            bool result = str.Equals(stat);
            
            if (result == true)
            {
                LinkButton1.Visible = true;
                
            }


            if (iduser != 0)
            {
                login_avt.Visible = false;
                pass_avt.Visible = false;
                btn_out.Visible = true;
                

                Button2.Visible = false;
                Button1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;


                Label1.Visible = true;
                Label1.Text = "Привет " + myuser + "!";



            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("shops.aspx");
        }
    }

}
