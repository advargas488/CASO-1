using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Caso_1
{
    internal class Program
    {

        public static string url = @"Data Source=ADRIAN\\SERVIDORSQL;Initial Catalog=Caso_1; Integrated Security = True";
        static void Main(string[] args)
        {
            SqlConnection conn = new SqlConnection(url);    
            conn.Open();
        }   
    }
}
