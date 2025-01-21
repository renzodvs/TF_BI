CREATE DATABASE TRANSIBOC_PARCIAL
  GO
/******** DEMO 07 ******/
  USE [TRANSIBOC_PARCIAL]
  GO
  CREATE TABLE [DIMAlmacen]
  (
	AlmacenID int,
   Capacidad int,
   Distrito nvarchar(25),
   Sucursal nvarchar(25),
   CONSTRAINT PK_AlmacenID PRIMARY KEY(AlmacenID)
  )
  GO

CREATE TABLE [DIMCliente] (
    [ClienteID] int,
    [CodDoc] nvarchar(10),
    [TipDoc] nvarchar(20),
    [Nombre] nvarchar(20),
    [Apellido] nvarchar(20),
	[Direccion] nvarchar(100),
	[Telefono] nvarchar(20),
	CONSTRAINT PK_ClienteID PRIMARY KEY(ClienteID)
)
  GO

CREATE TABLE [DIMEmpleado] (
    [EmpleadoID] int,
    [CodDoc] nvarchar(10),
    [Nombre] nvarchar(20),
    [Apellido] nvarchar(20),
	[Estado] nvarchar(20),
	[Sucursal_Trabajo] nvarchar(20),
	CONSTRAINT PK_EmpleadoID PRIMARY KEY(EmpleadoID)
)
GO
CREATE TABLE [DIMEnvio] (
    [EnvioID] int,
    [Descripcion] nvarchar(100),
    [Estado] nvarchar(20),
	CONSTRAINT PK_EnvioID PRIMARY KEY(EnvioID)
) 
GO
CREATE TABLE [DIMSolucion] (
    [SolucionID] int,
    [Descripcion] nvarchar(100),
    [Estado] nvarchar(50),
	[Tipo] nvarchar(50),
		CONSTRAINT PK_SolucionID PRIMARY KEY(SolucionID)
) 
GO
CREATE TABLE [DIMFecha] (
    [FechaID] int,
    [Dia_completo] datetime,
	[Dia] nvarchar(15),
    [NroSemana] int,
	[CodMes] nvarchar(6),
	[NroMes] int,
	[DesMes] nvarchar(15),
	[Anio] nvarchar(4),
	CONSTRAINT PK_FechaID PRIMARY KEY(FechaID)
)
GO 
CREATE TABLE [DIMGuia_Remision] (
    [Guia_RemisionID] int,
    [Descripcion] nvarchar(50),
	[Estado] nvarchar(15),
	CONSTRAINT PK_Guia_RemisionID PRIMARY KEY(Guia_RemisionID)
)
GO
CREATE TABLE [DIMMercaderia] (
    [MercaderiaID] int,
    [Descripcion] nvarchar(100),
	[Tipo] nvarchar(100),
	[Medida] nvarchar(100),
	[Peso] nvarchar(100),
	[Estado] nvarchar(50),
	CONSTRAINT PK_MercaderiaID PRIMARY KEY(MercaderiaID)
) 
GO
CREATE TABLE [DIMOrden_Venta] (
    [Orden_VentaID] int,
	[Descripcion] nvarchar(50),
	[Tipo] nvarchar(15),
	CONSTRAINT PK_Orden_VentaID PRIMARY KEY(Orden_VentaID)
)
GO
CREATE TABLE [DIMVehiculo] (
    [VehiculoID] int,
	[Modelo] nvarchar(15),
	[Placa] nvarchar(15),
	[Tipo] nvarchar(15),
	[Estado] nvarchar(15),
	CONSTRAINT PK_VehiculoID PRIMARY KEY(VehiculoID)
)
GO
CREATE TABLE [FACTLogistica] (
    [LogisticaID] int,
    [MercaderiaID] int,
    [AlmacenID] int,
	[VehiculoID] int,
    [ClienteID] int,
	[EnvioID] int,
	[EmpleadoID] int,
	[FechaID] int,
	[Guia_RemisionID] int,
	[Cantidad_operaciones_exitosas] int,
	[Cantidad_operaciones_fallidas] int,
	[Cantidad_operaciones_sin_vehiculos] int,
	[Cantidad_mercaderia_en_almacen] int,
	CONSTRAINT PK_LogisticaID PRIMARY KEY(LogisticaID)
	/*CONSTRAINT FK_MercaderiaID FOREIGN KEY (MercaderiaID) REFERENCES DIMMercaderia(MercaderiaID),
	CONSTRAINT FK_AlmacenID FOREIGN KEY (AlmacenID) REFERENCES DIMAlmacen(AlmacenID),
	CONSTRAINT FK_VehiculoID FOREIGN KEY (VehiculoID) REFERENCES DIMVehiculo(VehiculoID),
	CONSTRAINT FK_ClienteID FOREIGN KEY (ClienteID) REFERENCES DIMCliente(ClienteID),
	CONSTRAINT FK_EnvioID FOREIGN KEY (EnvioID) REFERENCES DIMEnvio(EnvioID),
	CONSTRAINT FK_EmpleadoID FOREIGN KEY (EmpleadoID) REFERENCES DIMEmpleado(EmpleadoID),
	CONSTRAINT FK_FechaID FOREIGN KEY (FechaID) REFERENCES DIMFecha(FechaID),
	CONSTRAINT FK_Guia_RemisionID FOREIGN KEY (Guia_RemisionID) REFERENCES DIMGuia_Remision(Guia_RemisionID)*/
)
GO
CREATE TABLE [FACTVentas] (
    [VentasID] int,
    [MercaderiaID] int,
    [Orden_VentaID] int,
	[ClienteID] int,
	[EmpleadoID] int,
	[FechaID] int,
	[Cantidad_ventas_mercaderia_semidaniada] int,
	[Cantidad_ventas_mes] int,
	[Cantidad_ventas_empleados_vigentes] int,
	CONSTRAINT PK_VentasID PRIMARY KEY(VentasID)
	/*CONSTRAINT FK_MercaderiaID FOREIGN KEY (MercaderiaID) REFERENCES DIMMercaderia(MercaderiaID),
	CONSTRAINT FK_Orden_VentaID FOREIGN KEY (Orden_VentaID) REFERENCES DIMOrden_Venta(Orden_VentaID),
	CONSTRAINT FK_ClienteID FOREIGN KEY (ClienteID) REFERENCES DIMCliente(ClienteID),
	CONSTRAINT FK_EmpleadoID FOREIGN KEY (EmpleadoID) REFERENCES DIMEmpleado(EmpleadoID),
	CONSTRAINT FK_FechaID FOREIGN KEY (FechaID) REFERENCES DIMFecha(FechaID)*/

)
GO
CREATE TABLE [FACTReclamos] (
    [ReclamosID] int,
    [VehiculoID] int,
    [ClienteID] int,
	[EmpleadoID] int,
	[SolucionID] int,
	[FechaID] int,
	[Guia_RemisionID] int,
	[Cantidad_reclamos_solucionados] int,
	[Cantidad_reclamos_nosolucionados] int,
	CONSTRAINT PK_ReclamosID PRIMARY KEY(ReclamosID)
	/*CONSTRAINT FK_VehiculoID FOREIGN KEY (VehiculoID) REFERENCES DIMVehiculo(VehiculoID),
	CONSTRAINT FK_ClienteID FOREIGN KEY (ClienteID) REFERENCES DIMCliente(ClienteID),
	CONSTRAINT FK_EmpleadoID FOREIGN KEY (EmpleadoID) REFERENCES DIMEmpleado(EmpleadoID),
	CONSTRAINT FK_SolucionID FOREIGN KEY (SolucionID) REFERENCES DIMSolucion(SolucionID),
	CONSTRAINT FK_FechaID FOREIGN KEY (FechaID) REFERENCES DIMFecha(FechaID),
	CONSTRAINT FK_Guia_RemisionID FOREIGN KEY (Guia_RemisionID) REFERENCES DIMGuia_Remision(Guia_RemisionID)*/
	
)
GO



