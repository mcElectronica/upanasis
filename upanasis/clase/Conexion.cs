using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace upanasis.clase
{
    public class Conexion
    {
        public SqlConnection conexion = new SqlConnection();

        public SqlConnection ObtenerConexion()
        {
            conexion = new SqlConnection("workstation id=bdupanasis.mssql.somee.com;packet size=4096;user id=irvinpleytez_SQLLogin_1;pwd=xu7qmj2a2v;data source=bdupanasis.mssql.somee.com;persist security info=False;initial catalog=bdupanasis");
            try
            {
                conexion.Open();
                return conexion;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DescargarConexion()
        {
            conexion.Dispose();
            return true;
        }
    }
}