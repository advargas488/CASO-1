using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Caso_1
{
    internal class Consulta_2
    {
        public void run(object i)
        {
            try
            {
                SqlConnection conn = new SqlConnection(@"Data Source=.\SERVIDORSQL;Initial Catalog=Caso_1; User ID=sa;Password=sa");
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter();
                da = new SqlDataAdapter("EXECUTE Consulta_2",conn);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    //aqui se imprime la data que pide el query
                    Console.WriteLine(dr["Nombre"]);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }
}
