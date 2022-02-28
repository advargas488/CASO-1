using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Caso_1
{
    internal class Consulta_1 
    {
        private SqlCommand cmd = new SqlCommand();
        private SqlDataAdapter da = new SqlDataAdapter();
        private DataTable dt = new DataTable();
        private SqlConnection conn = new SqlConnection(@"Data Source=.\SERVIDORSQL;Initial Catalog=Caso_1; User ID=sa;Password=sa");
        private String canton;
        public Consulta_1(String canton)
        {
            this.canton = canton;   
        }
        public void run()
        {
            try
            {
                cmd = new SqlCommand("Consulta_1", conn);
                DataTable dtbl = new DataTable();
                cmd.Parameters.Add(new SqlParameter("@Canton", this.canton));
                cmd.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmd;
                da.Fill(dt);
                //aqui se imprime la data que pide el query, puede quitar los comentarios
                //yo lo comente para no tener tanto output en mi consola
                //foreach (DataRow dr in dt.Rows)
                //{
                //    Console.WriteLine(dr["IdPartido"]);
                //    Console.WriteLine(dr["IdPartido"]);
                //}
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

    }
}
