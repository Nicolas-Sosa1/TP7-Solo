using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TP7_Programacion.Clases
{
    public class AccesoDatos
    {
        string cadenaConexion = @"Data Source=DESKTOP-Q0EVBE4\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
        public AccesoDatos()
        {

        }

        //METODOS
        public SqlConnection ObtenerConexion()
        {
            SqlConnection sqlConnection = new SqlConnection(cadenaConexion);
            try
            {
                sqlConnection.Open();

                return sqlConnection;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public SqlDataAdapter ObtenerAdaptador(string consultaSql)
        {
            SqlDataAdapter sqlDataAdapter;
            try
            {
                sqlDataAdapter = new SqlDataAdapter(consultaSql, ObtenerConexion());
                return sqlDataAdapter;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}