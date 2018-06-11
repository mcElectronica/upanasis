using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using upanasis.clase;

namespace upanasis
{
    /// <summary>
    /// Descripción breve de servicio
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class servicio : System.Web.Services.WebService
    {

        [WebMethod]
        public List<Usuario> RegistroAlumno(string us, string pas, int ti)
        {
            Conexion conexion = new Conexion();
            conexion.ObtenerConexion();
            SqlCommand cmm = new SqlCommand();
            cmm.Parameters.AddWithValue("user", us);
            cmm.Parameters.AddWithValue("pass", pas);
            cmm.Parameters.AddWithValue("tipo", ti);
            cmm.CommandText = "dbo.usuario";
            cmm.CommandType = System.Data.CommandType.StoredProcedure;
            cmm.Connection = conexion.conexion;
            SqlDataReader dr = cmm.ExecuteReader();

            List<Usuario> usuarioList = new List<Usuario>();
            while (dr.Read())
            {
                usuarioList.Add(new Usuario()
                {
                    id = dr.GetInt32(0),
                    pnombre = dr.GetString(1),
                    snombre = dr.GetString(2),
                    papellido = dr.GetString(3),
                    sapellido = dr.GetString(4),
                    email = dr.GetString(5),
                    idTipoUser = dr.GetInt32(6),
                    user = dr.GetString(7),
                    pass = dr.GetString(8)

                });
            }

            conexion.DescargarConexion();
            return usuarioList;
        }


        [WebMethod]
        public int insertarUsuario(string pnombre, string snombre, string papellido, string sapellido, 
            string email, int tipo, string user, string pass)
        {
            Conexion conexion = new Conexion();
            conexion.ObtenerConexion();
            SqlCommand cmm = new SqlCommand();
            cmm.Parameters.AddWithValue("pnombre", pnombre );
            cmm.Parameters.AddWithValue("snombre", snombre);
            cmm.Parameters.AddWithValue("papellido", papellido);
            cmm.Parameters.AddWithValue("sapellido", sapellido);
            cmm.Parameters.AddWithValue("email", email);
            cmm.Parameters.AddWithValue("tipo", tipo);
            cmm.Parameters.AddWithValue("user", user);
            cmm.Parameters.AddWithValue("pass", pass);
            cmm.CommandText = "dbo.insertUsuario";
            cmm.CommandType = System.Data.CommandType.StoredProcedure;
            cmm.Connection = conexion.conexion;
            int res = cmm.ExecuteNonQuery();

            conexion.DescargarConexion();
            return res;
        }
    }
}
