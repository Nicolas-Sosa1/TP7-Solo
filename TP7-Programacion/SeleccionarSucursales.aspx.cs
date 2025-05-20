using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP7_Programacion.Clases;



namespace TP7_Programacion
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (IsPostBack == false) 
            {

                //Cargar ListView Sucursales
                CargarListView();

                //Cargar Provincias DataList
                CargarProvincias();
            }
            
        }

        //Evento hacer clic en el botón Seleccionar de cada sucursal
        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {

            // Verificamos que el evento recibido sea el correspondiente a seleccionar una sucursal

            if (e.CommandName == "eventoSeleccionar")
            {
                // Dividimos el argumento recibido (Id|Nombre|Descripcion) usando el separador '|'

                string[] datos = e.CommandArgument.ToString().Split('|');

                // Verificamos que se hayan recibido exactamente 3 partes: Id, Nombre y Descripción
                if (datos.Length == 3)
                {
                    // Asignamos los valores a variables individuales
                    string idSucursal = datos[0];
                    string nombre = datos[1];
                    string descripcion = datos[2];


                    // Si la tabla no está en la sesión, la creamos

                    if (Session["tabla"] == null)
                    {
                        //si no existe creamos una tabla
                        Session["tabla"] = CrearTabla();
                    }

                    //Agregar nueva fila
                    AgregarFila((DataTable)Session["tabla"], idSucursal, nombre, descripcion);
                }
                
            }
        }
        

        private DataTable CrearTabla()
        {
            DataTable dataTable = new DataTable();

            DataColumn dataColumn;

            dataColumn = new DataColumn("Id_Sucursal", typeof(string));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("NombreSucursal", typeof(string));
            dataTable.Columns.Add(dataColumn);

            dataColumn = new DataColumn("DescripcionSucursal", typeof(string));
            dataTable.Columns.Add(dataColumn);

            return dataTable;
        }

        private DataTable AgregarFila(DataTable dataTable, string idSucursal, string nombre, string descripcion)
        {
            DataRow dataRow = dataTable.NewRow();

            dataRow["Id_Sucursal"] = idSucursal;
            dataRow["NombreSucursal"] = nombre;
            dataRow["DescripcionSucursal"] = descripcion;

            dataTable.Rows.Add(dataRow);

            return dataTable;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtNombreSucursales.Text == "")
            {
                CargarListView();
            }
            else if(txtNombreSucursales.Text != "")
            {

                GestionSucursales gestionSucursales = new GestionSucursales();
                lvSucursales.DataSource = gestionSucursales.BuscarSucursalPorNombre(txtNombreSucursales.Text);
                lvSucursales.DataBind();
            }
        }

        private void CargarListView()
        {
            GestionSucursales gestionSucursales = new GestionSucursales();
            lvSucursales.DataSource = gestionSucursales.ObtenerTodosLosProductos();
            lvSucursales.DataBind();
        }

        private void CargarProvincias()
        {
            GestionSucursales gestion = new GestionSucursales();
            dlProvincias.DataSource = gestion.ObtenerProvincias();
            dlProvincias.DataBind();
        }




        protected void btnProvincia_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "filtrarProvincia")
            {
                int idProvincia = Convert.ToInt32(e.CommandArgument);
                GestionSucursales gestion = new GestionSucursales();
                lvSucursales.DataSource = gestion.ObtenerSucursalesPorProvincia(idProvincia);
                lvSucursales.DataBind();
            }
        }

        protected void lvSucursales_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager dataPager = (DataPager)lvSucursales.FindControl("DataPager1");
            if (dataPager != null)
            {
                dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            }

            CargarListView();
        }

    }
}