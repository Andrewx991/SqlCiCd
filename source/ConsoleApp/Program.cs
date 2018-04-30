using System;
using System.Data.SqlClient;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello SQL CI/CD!");

            var connectionStringBuilder = new SqlConnectionStringBuilder();
            connectionStringBuilder.IntegratedSecurity = true;
            connectionStringBuilder.DataSource = ".";
            connectionStringBuilder.InitialCatalog = "master";

            using (var connection = new SqlConnection(connectionStringBuilder.ConnectionString))
            {
                connection.Open();

                connection.Close();
            }
        }
    }
}
