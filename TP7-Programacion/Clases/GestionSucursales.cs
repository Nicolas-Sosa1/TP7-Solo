using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TP7_Programacion.Clases
{
    public class GestionSucursales
    {
        //CONSTRCUTOR
        public GestionSucursales()
        {

        }

        //METODOS
        private DataTable ObtenerTablaProductos(string nombreTabla, string consultaSql)
        {
            // Creamos un nuevo contenedor de datos
            DataSet dataSet = new DataSet();

            // Instanciamos nuestra clase de acceso a datos para obtener el adaptador
            AccesoDatos accesoDatos = new AccesoDatos();

            // Obtenemos un adaptador SQL configurado con la consulta y la conexión
            SqlDataAdapter sqlDataAdapter = accesoDatos.ObtenerAdaptador(consultaSql);

            // Ejecutamos la consulta y llenamos el DataSet con los resultados,
            // usando como nombre interno el que se pasó como parámetro (nombreTabla)
            sqlDataAdapter.Fill(dataSet, nombreTabla);

            // Devolvemos la tabla del DataSet que acabamos de llenar
            return dataSet.Tables[nombreTabla];
        }

        // Obtiene todas las filas de la tabla 'Sucursal' desde la base de datos
        public DataTable ObtenerTodosLosProductos()
        {
            // Definimos la consulta SQL para traer todas las columnas y filas de la tabla 'Sucursal'
            string consultaSql = "SELECT * FROM Sucursal";

            return ObtenerTablaProductos("Sucursal", consultaSql);
        }

        public DataTable BuscarSucursalPorNombre(string nombre)
        {
            string consultaSql = $"SELECT * FROM Sucursal WHERE NombreSucursal LIKE '%{nombre}%'";
            return ObtenerTablaProductos("Sucursal", consultaSql);
        }

        public DataTable ObtenerProvincias()
        {
            string consulta = "SELECT * FROM Provincia";
            return ObtenerTablaProductos("Provincia", consulta);
        }

        public DataTable ObtenerSucursalesPorProvincia(int idProvincia)
        {
            string consulta = "SELECT * FROM Sucursal WHERE Id_ProvinciaSucursal = @idProvincia";
            SqlDataAdapter adapter = new SqlDataAdapter(consulta, new AccesoDatos().ObtenerConexion());
            adapter.SelectCommand.Parameters.AddWithValue("@idProvincia", idProvincia);
            DataSet ds = new DataSet();
            adapter.Fill(ds, "Sucursal");
            return ds.Tables["Sucursal"];
        }


    }


}
