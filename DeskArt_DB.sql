DROP DATABASE IF EXISTS DeskArt;

CREATE DATABASE DeskArt;

USE DeskArt;

CREATE TABLE Usuario (
    idUsuario INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(65),
    primerApellido VARCHAR(65),
    segundoApellido VARCHAR(65),
    nombreUsuario VARCHAR(65),
    contrasenia VARCHAR(65),
    colonia VARCHAR(65),
    calle VARCHAR(65),
    cp VARCHAR(65),
    num_ex VARCHAR(65),
    telefono VARCHAR(65),
    email VARCHAR(65),
	sexo VARCHAR(65)
);

CREATE TABLE UsuarioTienda (
    idUsuarioTienda INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(65),
    primerApellido VARCHAR(65),
    segundoApellido VARCHAR(65),
    nombreUsuario VARCHAR(65),
    contrasenia VARCHAR(65),
    telefono VARCHAR(65),
    email VARCHAR(65),
	cp VARCHAR(65),
    rol INT,
	estatus INT,
	sexo VARCHAR(65)
);

CREATE TABLE Producto (
    idProducto INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(65),
    descripcion TEXT,
    alto VARCHAR(65),
    largo VARCHAR(65),
    ancho VARCHAR(65),
    precio VARCHAR(65),
    imagen TEXT
);

CREATE TABLE MateriaP (
    idMateriaP INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(65),
    medida VARCHAR(65)
);

CREATE TABLE Receta (
    idReceta INT IDENTITY PRIMARY KEY,
    cantidad INT,
    MateriaP_idMateriaP INT,
    Producto_idProducto INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Merma (
    idMerma INT IDENTITY PRIMARY KEY,
    cantidad INT,
    descripcion VARCHAR(45),
    MateriaP_idMateriaP INT,
    UsuarioTienda_idUsuarioTienda INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (UsuarioTienda_idUsuarioTienda) REFERENCES UsuarioTienda(idUsuarioTienda)
);

CREATE TABLE Inventario (
    idInventario INT IDENTITY PRIMARY KEY,
    cantidad VARCHAR(45),
    MateriaP_idMateriaP INT,
    FOREIGN KEY (MateriaP_idMateriaP) REFERENCES MateriaP(idMateriaP)
);

CREATE TABLE Proveedor (
    idProveedor INT IDENTITY PRIMARY KEY,
    empresa VARCHAR(45),
    nombrep VARCHAR(45),
    telefono VARCHAR(45),
    correo VARCHAR(45)
);

CREATE TABLE Proveedor_has_MateriaP (
    idProveedor_has_MateriaP INT IDENTITY PRIMARY KEY,
    MateriaP_idMateriaP1 INT,
    Proveedor_idProveedor1 INT,
    FOREIGN KEY (MateriaP_idMateriaP1) REFERENCES MateriaP(idMateriaP),
    FOREIGN KEY (Proveedor_idProveedor1) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE CompraProd (
    idCompraProd INT IDENTITY PRIMARY KEY,
    cantidad INT,
    subTotal INT,
    Proveedor_has_MateriaP_idProveedor_has_MateriaP INT,
    FOREIGN KEY (Proveedor_has_MateriaP_idProveedor_has_MateriaP) REFERENCES Proveedor_has_MateriaP(idProveedor_has_MateriaP)
);

CREATE TABLE CompraTotal (
    idCompra INT IDENTITY PRIMARY KEY,
    descripcion TEXT,
    total FLOAT,
    CompraProd_idCompraProd INT,
    FOREIGN KEY (CompraProd_idCompraProd) REFERENCES CompraProd(idCompraProd)
);

CREATE TABLE VentaTotal (
    idVentaTotal INT IDENTITY PRIMARY KEY,
    descripcion TEXT,
    total FLOAT
);

CREATE TABLE VentaProd (
    idVentaProd INT IDENTITY PRIMARY KEY,
    cantidad INT,
    subTotal FLOAT,
    Usuario_idUsuario INT,
    Producto_idProducto INT,
	VentaTotal_idVentaTotal INT
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto),
	FOREIGN KEY (VentaTotal_idVentaTotal) REFERENCES VentaTotal(idVentaTotal)
);

CREATE TABLE EstadoProduc (
    idEstadoProduc INT IDENTITY PRIMARY KEY,
    descripcion VARCHAR(45)
);

CREATE TABLE Produccion (
    idProduccion INT IDENTITY PRIMARY KEY,
    VentaTotal_idVentaTotal INT,
    EstadoProduc_idEstadoProduc INT,
    FOREIGN KEY (VentaTotal_idVentaTotal) REFERENCES VentaTotal(idVentaTotal),
    FOREIGN KEY (EstadoProduc_idEstadoProduc) REFERENCES EstadoProduc(idEstadoProduc)
);

CREATE TABLE Carrito(
    idCarrito INT IDENTITY PRIMARY KEY,
    Producto_idProducto INT,
    Usuario_idUsuario INT,
    FOREIGN KEY (Usuario_idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (Producto_idProducto) REFERENCES Producto(idProducto)
);

-- Insertar datos de ejemplo

INSERT INTO Producto (nombre, descripcion, alto, largo, ancho, precio, imagen) VALUES
('Escritorio Moderno', 'Escritorio moderno de madera con acabados metalicos.', '75cm', '120cm', '60cm', '150.00', 'imagen1.jpg'),
('Escritorio Clasico', 'Escritorio clasico con cajones y acabado en caoba.', '80cm', '130cm', '65cm', '200.00', 'imagen2.jpg'),
('Escritorio Ejecutivo', 'Escritorio ejecutivo amplio con multiples compartimentos.', '85cm', '150cm', '70cm', '300.00', 'imagen3.jpg'),
('Escritorio Compacto', 'Escritorio compacto ideal para espacios pequenos.', '70cm', '100cm', '50cm', '100.00', 'imagen4.jpg'),
('Escritorio Ajustable', 'Escritorio con altura ajustable y espacio para almacenamiento.', '60-90cm', '110cm', '55cm', '180.00', 'imagen5.jpg');

SELECT * FROM Carrito;
SELECT * FROM Usuario;
SELECT * FROM Producto;
SELECT * FROM proveedor;

delete Carrito;

INSERT INTO Usuario (nombre, email, contrasenia, sexo , colonia, calle, cp)
VALUES 
('Angel', 'francis15abf@gmail.com', '1234', '1', 'Villas de san nicolas', 'Calle Ninos Heroes #5', '36218');

SELECT * FROM Usuario;

INSERT INTO Proveedor (empresa, nombrep, telefono, correo) VALUES
('Empresa ABC', 'Juan Perez', '555-1234', 'juan.perez@empresaabc.com'),
('Muebles XYZ', 'Maria Lopez', '555-5678', 'maria.lopez@mueblesxyz.com'),
('Decoraciones LMN', 'Luis Martinez', '555-9101', 'luis.martinez@decoracioneslmn.com');
