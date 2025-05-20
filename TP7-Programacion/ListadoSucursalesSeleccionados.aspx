<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursalesSeleccionados.aspx.cs" Inherits="TP7_Programacion.ListadoSucursalesSeleccionados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hlListadoDeSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de sucursales</asp:HyperLink>
            <asp:HyperLink ID="hlMostrarSucursalesSeleccionadas" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionados.aspx">Mostrar sucursales seleccionadas</asp:HyperLink>
            <br />
            <br />
            <h1>Mostrar sucursales seleccionadas</h1>

            <asp:GridView runat="server" ID="gvSucursales" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="ID_SUCURSAL">
                        <ItemTemplate>
                            <asp:Label ID="lblIdSucursales" runat="server" Text='<%# Bind("Id_Sucursal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="NOMBRE">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreSucursal" runat="server" Text='<%# Bind("NombreSucursal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DESCRIPCION">
                        <ItemTemplate>
                            <asp:Label ID="lblDescripcionSucursal" runat="server" Text='<%# Bind("DescripcionSucursal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
