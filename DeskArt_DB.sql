Drop database DeskArt;

create database DeskArt;

use DeskArt;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nombre VARCHAR(65),
    primerApellido VARCHAR(65),
    segundoApellido VARCHAR(65),
    nombreUsuario VARCHAR(65),
    contrasenia VARCHAR(65),
    colonia VARCHAR(65),
    calle VARCHAR(65),
    num_ex VARCHAR(65),
    telefono VARCHAR(65),
    email VARCHAR(65)
);

CREATE TABLE Área (
    idÁrea INT PRIMARY KEY,
    tipo VARCHAR(45)
);

CREATE TABLE UsuarioTienda (
    idUsuarioTienda INT PRIMARY KEY,
    nombre VARCHAR(65),
    primerApellido VARCHAR(65),
    segundoApellido VARCHAR(65),
    nombreUsuario VARCHAR(65),
    contrasenia VARCHAR(65),
    telefono VARCHAR(65),
    email VARCHAR(65),
    Área_idÁrea INT,
    FOREIGN KEY (Área_idÁrea) REFERENCES Área(idÁrea)
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
	nombre VARCHAR(65),
	descripcion text,
    alto VARCHAR(65),
    largo VARCHAR(65),
    ancho VARCHAR(65),
    precio VARCHAR(65),
	imagen text
);


CREATE TABLE MateriaP (
    idMateriaP INT PRIMARY KEY,
    nombre VARCHAR(65),
    medida VARCHAR(65)
);

CREATE TABLE Receta (
    idReceta INT PRIMARY KEY,
    cantidad INT,
    MateriaP_idMateriaP INT,
    Producto_idProducto INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Merma (
    idMerma INT PRIMARY KEY,
    cantidad INT,
    descripción VARCHAR(45),
    MateriaP_idMateriaP INT,
    UsuarioTienda_idUsuarioTienda INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (UsuarioTienda_idUsuarioTienda) REFERENCES UsuarioTienda(idUsuarioTienda)
);

CREATE TABLE Inventario (
    idInventario INT PRIMARY KEY,
    cantidad VARCHAR(45),
    MateriaP_idMateriaP INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP)
);

CREATE TABLE Proveedor (
    idProveedor INT PRIMARY KEY,
    empresa VARCHAR(45),
    nombrep VARCHAR(45),
    telefono VARCHAR(45),
    correo VARCHAR(45)
);

CREATE TABLE Proveedor_has_MateriaP (
    idProveedor_has_MateriaP INT PRIMARY KEY,
    MateriaP_idMateriaP1 INT,
    Proveedor_idProveedor1 INT,
    FOREIGN KEY (MateriaP_idMateriaP1) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (Proveedor_idProveedor1) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE CompraProd (
    idCompraProd INT PRIMARY KEY,
    cantidad INT,
    subTotal INT,
    Proveedor_has_MateriaP_idProveedor_has_MateriaP INT,
    FOREIGN KEY (Proveedor_has_MateriaP_idProveedor_has_MateriaP) REFERENCES Proveedor_has_MateriaP(idProveedor_has_MateriaP)
);

CREATE TABLE CompraTotal (
    idCompra INT PRIMARY KEY,
    descripción TEXT,
    total FLOAT,
    CompraProd_idCompraProd INT,
    FOREIGN KEY (CompraProd_idCompraProd) REFERENCES CompraProd(idCompraProd)
);

CREATE TABLE VentaProd (
    idVentaProd INT PRIMARY KEY,
    cantidad INT,
    subTotal FLOAT,
    UsuarioTienda_idUsuarioTienda1 INT,
    Usuario_idUsuario INT,
    Producto_idProducto INT,
    FOREIGN KEY (UsuarioTienda_idUsuarioTienda1) REFERENCES UsuarioTienda(idUsuarioTienda),
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE VentaTotal (
    idVentaTotal INT PRIMARY KEY,
    Descripcion TEXT,
    Total FLOAT,
    VentaProd_idVentaProd INT,
    FOREIGN KEY (VentaProd_idVentaProd) REFERENCES VentaProd(idVentaProd)
);

CREATE TABLE EstadoProduc (
    idEstadoProduc INT PRIMARY KEY,
    descripción VARCHAR(45)
);

CREATE TABLE Producción (
    idProducción INT PRIMARY KEY,
    VentaTotal_idVentaTotal INT,
    EstadoProduc_idEstadoProduc INT,
    FOREIGN KEY (VentaTotal_idVentaTotal) REFERENCES VentaTotal(idVentaTotal),
    FOREIGN KEY (EstadoProduc_idEstadoProduc) REFERENCES EstadoProduc(idEstadoProduc)
);

CREATE TABLE [dbo].[LoginMobil] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [nombre] NVARCHAR(100) NOT NULL,
    [email] NVARCHAR(100) NOT NULL,
    [contrasena] NVARCHAR(100) NOT NULL,
    [sexo] CHAR(1) NOT NULL,
    [direccion] NVARCHAR(255) NOT NULL,
    [cp] NVARCHAR(10) NOT NULL
);
