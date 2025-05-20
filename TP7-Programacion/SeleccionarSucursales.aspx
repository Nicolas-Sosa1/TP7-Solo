<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_Programacion.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style>
        
         .auto-style1 {
             width: 221px;
         }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hlListadoDeSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de sucursales</asp:HyperLink>

            <asp:HyperLink ID="hlMostrarSucursalesSeleccionadas" runat="server" NavigateUrl="~/ListadoSucursalesSeleccionados.aspx">Mostrar sucursales selecciones</asp:HyperLink>

            <h2>Listado de sucursales</h2>
            <p>Busqueda por nombre de sucursal:&nbsp;
                <asp:TextBox ID="txtNombreSucursales" runat="server" Width="369px" ValidationGroup="1"></asp:TextBox>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ValidationGroup="1" />
            &nbsp;</p>
            <asp:DataList ID="dlProvincias" runat="server">
                <ItemTemplate>
                    <asp:Button ID="btnProvincia" runat="server" Text='<%# Eval("DescripcionProvincia") %>' CommandName="filtrarProvincia" CommandArgument='<%# Eval("Id_Provincia") %>' OnCommand="btnProvincia_Command" />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:ListView ID="lvSucursales" runat="server" GroupItemCount="3">
                
                <EditItemTemplate>
                    <td runat="server" style="background-color: #999999;">NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No se han devuelto datos.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">NombreSucursal:
                        <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color: #E0FFFF;color: #333333;" class="auto-style1">&nbsp;<asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />&nbsp;<asp:ImageButton ID="imgBtnSucursales" runat="server" Height="100px" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Width="100px" />
                        <br />
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                        <br />
                        <br />
                        <asp:Button ID="btnSeleccionar" runat="server" CommandArgument='<%# Eval("Id_Sucursal") + "|" + Eval("NombreSucursal") + "|" + Eval("DescripcionSucursal") %>'  CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command" Text="Seleccionar" />
                        <br /></td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">NombreSucursal:
                        <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                        <br />URL_Imagen_Sucursal:
                        <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                        <br />DescripcionSucursal:
                        <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
            <br />

            <br />
            <br />
        </div>
    </form>
</body>
</html>
