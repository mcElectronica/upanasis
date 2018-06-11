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
            conexion = new SqlConnection("workstation id=upanasis.mssql.somee.com;packet size=4096;user id=miltonRutus_SQLLogin_1;pwd=2h9prc4bhd;data source=upanasis.mssql.somee.com;persist security info=False;initial catalog=upanasis");
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