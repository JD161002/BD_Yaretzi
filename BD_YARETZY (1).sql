CREATE DATABASE Bodega_Yaretzi
USE Bodega_Yaretzi
--drop database Bodega_Yaretzi
CREATE TABLE [dbo].[TB_BOLETA](
	[NUM_BOL] [char](5) NOT NULL,
	[FECHA_BOL] [date] NOT NULL,
	[COD_CLI] [char](5) NOT NULL,
	[COD_EMPLE] [char](5) NOT NULL,
	[ESTADO_BOL] [varchar](10) NOT NULL,
	[PORC_IGV_BOL] decimal(18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUM_BOL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_DETALLE_BOLETA](
	[NUM_BOL] [char](5) NOT NULL,
	[COD_PRO] [char](5) NOT NULL,
	[CANTIDAD_VEN] [int] NOT NULL,
	[PRECIO_VEN] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUM_BOL] ASC,
	[COD_PRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_CATEGORIAS](
	[COD_CAT] [char](5) NOT NULL,
	[NOMBRE] [varchar](25) NOT NULL,
	[DESCRIPCION] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_CAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_EMPLEADO](
	[COD_EMPLE] [char](5) NOT NULL,
	[NOMBRES_EMPLE] [varchar](25) NOT NULL,
	[DNI_EMPLE] [char](8) NOT NULL,
	[DIRECCION] [varchar](60) NOT NULL,
	[ESTADO_CIVIL] [char](1) NOT NULL,
	[NIVEL_EDUCA] [varchar](30) NOT NULL,
	[COD_DIST] [char](5) NOT NULL,
	[TELEFONO] [varchar](12) NOT NULL,
	[EMAIL] [varchar](35) NOT NULL,
	[SUELDO_BASICO] [money] NOT NULL,
	[FECHA_INGRESO] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_EMPLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_PRODUCTO](
	[COD_PRO] [char](5) NOT NULL,
	[DESC_PRO] [varchar](45) NOT NULL,
	[PRECIO_PRO] [money] NOT NULL,
	[STOCK_MIN] [int] NULL,
	[STOCK_ACT] [int] NULL,
	[UNIDAD_MED] [varchar](30) NOT NULL,
	[FECHA_VENC] [date] NULL,
	[COD_CAT] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_ABASTECIMIENTO](
	[COD_PROV] [char](5) NOT NULL,
	[COD_PRO] [char](5) NOT NULL,
	[PRECIO_ABA] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PROV] ASC,
	[COD_PRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_CLIENTE](
	[COD_CLI] [char](5) NOT NULL,
	[DNI_CLI] [char](8) NOT NULL,
	[NOMBRES_CLI] [varchar](25) NOT NULL,
	[COD_DIST] [char](5) NOT NULL,
	[DIRECCION] [varchar](50) NOT NULL,	
	[TELEFONO_CLI] [varchar](9) NOT NULL,
	[FECHA_REG] [date] NOT NULL,
	[CONTACTO] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_CLI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_ORDEN_COMPRA](
	[NUM_ORC] [char](5) NOT NULL,
	[FECHA_ORC] [date] NOT NULL,
	[COD_PROV] [char](5) NOT NULL,
	[FECHA_ATE] [date] NOT NULL,	
	[ESTADO_ORC] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUM_ORC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_DETALLES_COMPRA](
	[NUM_ORC] [char](5) NOT NULL,
	[COD_PRO] [char](5) NOT NULL,
	[CANTIDAD_PED] int NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUM_ORC] ASC,
	[COD_PRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_PROVEEDOR](
	[COD_PROV] [char](5) NOT NULL,
	[RAZON_SOC_PROV] [varchar](50) NOT NULL,
	[DIRECCION_PROV] [varchar](50) NOT NULL,
	[TELEFONO_PROV] [char](15) NOT NULL,
	[COD_DIST] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PROV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[TB_DISTRITO](
	[COD_DIST] [char](5) NOT NULL,
	[NOMBRE_DIST] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_DIST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[TB_DETALLE_BOLETA]  WITH CHECK ADD FOREIGN KEY([COD_PRO])
REFERENCES [dbo].[TB_PRODUCTO] ([COD_PRO])
GO

ALTER TABLE [dbo].[TB_DETALLE_BOLETA]  WITH CHECK ADD FOREIGN KEY([NUM_BOL])
REFERENCES [dbo].[TB_BOLETA] ([NUM_BOL])
GO

ALTER TABLE [dbo].[TB_BOLETA]  WITH CHECK ADD FOREIGN KEY([COD_EMPLE])
REFERENCES [dbo].[TB_EMPLEADO] ([COD_EMPLE])
GO

ALTER TABLE [dbo].[TB_BOLETA]  WITH CHECK ADD FOREIGN KEY(COD_CLI)
REFERENCES [dbo].[TB_CLIENTE] (COD_CLI)
GO

ALTER TABLE [dbo].[TB_ABASTECIMIENTO]  WITH CHECK ADD FOREIGN KEY([COD_PRO])
REFERENCES [dbo].[TB_PRODUCTO] ([COD_PRO])
GO

ALTER TABLE [dbo].[TB_PRODUCTO]  WITH CHECK ADD FOREIGN KEY([COD_CAT])
REFERENCES [dbo].[TB_CATEGORIAS] ([COD_CAT])
GO

ALTER TABLE [dbo].TB_ORDEN_COMPRA  WITH CHECK ADD FOREIGN KEY([COD_PROV])
REFERENCES [dbo].[TB_PROVEEDOR] ([COD_PROV])
GO

ALTER TABLE [dbo].[TB_ABASTECIMIENTO]  WITH CHECK ADD FOREIGN KEY([COD_PROV])
REFERENCES [dbo].[TB_PROVEEDOR] ([COD_PROV])
GO

ALTER TABLE [dbo].[TB_DETALLES_COMPRA]  WITH CHECK ADD FOREIGN KEY([COD_PRO])
REFERENCES [dbo].[TB_PRODUCTO] ([COD_PRO])
GO

ALTER TABLE [dbo].[TB_DETALLES_COMPRA]  WITH CHECK ADD FOREIGN KEY([NUM_ORC])
REFERENCES [dbo].[TB_ORDEN_COMPRA] ([NUM_ORC])
GO

ALTER TABLE [dbo].[TB_PROVEEDOR]  WITH CHECK ADD FOREIGN KEY([COD_DIST])
REFERENCES [dbo].[TB_DISTRITO] ([COD_DIST])
GO

ALTER TABLE [dbo].[TB_CLIENTE]  WITH CHECK ADD FOREIGN KEY([COD_DIST])
REFERENCES [dbo].[TB_DISTRITO] ([COD_DIST])
GO
ALTER TABLE [dbo].[TB_EMPLEADO]  WITH CHECK ADD FOREIGN KEY([COD_DIST])
REFERENCES [dbo].[TB_DISTRITO] ([COD_DIST])
GO

--llenamos las tablas 
INSERT INTO [TB_DISTRITO](COD_DIST, NOMBRE_DIST)
VALUES
('D0001', 'Centro Hist�rico'),
('D0002', 'San Andr�s'),
('D0003', 'El Recreo'),
('D0004', 'Mansiche'),
('D0005', 'Las Capullanas'),
('D0006', 'Covicorti'),
('D0007', 'Primavera'),
('D0008', 'Huerta Grande'),
('D0009', 'Los Cedros'),
('D0010', 'La Intendencia'),
('D0011', 'Santa Mar�a'),
('D0012', 'Las Casuarinas'),
('D0013', 'La Arboleda'),
('D0014', 'Los Granados'),
('D0015', 'Los Portales'),
('D0016', 'Andr�s R�zuri'),
('D0017', 'Los Rosales de San Andr�s'),
('D0018', 'Galeno'),
('D0019', 'El Molino'),
('D0020', 'Santo Dominguito'),
('D0021', 'Torres Araujo'),
('D0022', 'Santa Isabel'),
('D0024', 'San Salvador'),
('D0025', 'Trupal'),
('D0026', 'Santa In�s'),
('D0027', 'Las Quintanas'),
('D0028', 'Mochica'),
('D0029', 'Aranjuez'),
('D0030', 'Chicago'),
('D0031', 'Los Pinos'),
('D0032', 'Santa Teresa de �vila'),
('D0033', 'San Isidro'),
('D0034', 'Los Jardines'),
('D0035', 'La Rinconada'),
('D0036', 'Miraflores'),
('D0037', 'Monserrate'),
('D0038', 'Los Naranjos'),
('D0039', 'Chim�'),
('D0040', 'Vista Bella'),
('D0041', 'San Fernando'),
('D0042', 'Palermo'),
('D0043', 'El Bosque'),
('D0044', 'Independencia'),
('D0045', 'Jorge Ch�vez'),
('D0046', 'Vista Hermosa'),
('D0047', 'San Vicente'),
('D0048', 'La Noria'),
('D0049', 'San Luis'),
('D0050', 'El Alambre'),
('D0051', 'La Merced'),
('D0052', 'La Perla'),
('D0053', 'Daniel Hoyle'),
('D0054', 'El Sol'),
('D0055', 'Huerta Bella'),
('D0056', '20 de abril'),
('D0057', 'San Eloy'),
('D0058', 'Pay Pay'),
('D0059', 'Ingenier�a'),
('D0060', 'Libertad');

SELECT *FROM TB_DISTRITO

INSERT INTO [TB_EMPLEADO](COD_EMPLE, NOMBRES_EMPLE, DNI_EMPLE, DIRECCION, ESTADO_CIVIL, NIVEL_EDUCA,COD_DIST, TELEFONO, EMAIL, SUELDO_BASICO, FECHA_INGRESO)
VALUES
('EM001','Isabel Mendez',87654321,'Av. miguel grau' ,'1','Segundaria cumplido','D0001','987654321','isabel@gmail.com','1025','9-11-2023'),
('EM002', 'Carlos Gomez', 76543210, 'Calle Lima', '2', 'Superior','D0020', '987654322', 'carlos@gmail.com', '1025', '2023-08-12'),
('EM003', 'Ana Rodriguez', 65432109, 'Jr. Arequipa', '1', 'Superiror','D0014', '987654323', 'ana@gmail.com', '1025', '2023-07-13'),
('EM004', 'Juan Perez', 54321098, 'Av. Brasil', '2', 'Segundaria cumplido','D0015', '987654324', 'juan@gmail.com', '1200', '2023-06-14'),
('EM005', 'Laura Torres', 43210987, 'Jr. Huancayo', '1', 'Superior','D0003', '987654325', 'laura@gmail.com', '1200', '2023-05-15'),
('EM006', 'Miguel Chavez', 32109876, 'Calle Tacna', '1', 'Superior','D0008', '987654326', 'miguel@gmail.com', '1250', '2023-04-16'),
('EM007', 'Rosa Lopez', 21098765, 'Av. Puno', '2', 'Segundaria cumplido','D0002', '987654327', 'rosa@gmail.com', '1050', '2023-03-17'),
('EM008', 'Pedro Soto', 10987654, 'Jr. Cusco', '2', 'Segundaria cumplido','D0009', '987654328', 'pedro@gmail.com', '1200', '2023-02-18'),
('EM009', 'Luis Flores', 98765432, 'Av. Amazonas', '1', 'Segundaria cumplido','D0005', '987654329', 'luis@gmail.com', '1250', '2023-01-19'),
('EM010', 'Laura Gonsales', 87564123, 'Av. Alpamayo', '2', 'Segundaria cumplido','D0011', '987654321', 'Laura@gmail.com', '1250', '2023-09-02'
);
select *from TB_EMPLEADO

INSERT INTO TB_CLIENTE (COD_CLI, DNI_CLI, NOMBRES_CLI,COD_DIST, DIRECCION, TELEFONO_CLI, FECHA_REG, CONTACTO)
VALUES
('CL001','87654321','Ana Sanchez','D0007','Av. Alpamayo','987654321','2023-08-11' ,'Jun Ramirez'),
('CL002', '76543210', 'Carlos Gomez','D0002', 'Calle Lima', '987654322', '2023-08-12', 'Maria Torres'),
('CL003', '65432109', 'Laura Rodriguez','D0003', 'Jr. Arequipa', '987654323', '2023-08-13', 'Pedro Chavez'),
('CL004', '54321098', 'Juan Perez','D0004', 'Av. Brasil', '987654324', '2023-08-14', 'Luisa Flores'),
('CL005', '43210987', 'Rosa Torres','D0012', 'Jr. Huancayo', '987654325', '2023-08-15', 'Javier Lopez'),
('CL006', '32109876', 'Miguel Chavez','D0021', 'Calle Tacna', '987654326', '2023-08-16', 'Ana Ramirez'),
('CL007', '21098765', 'Luisa Lopez','D0017', 'Av. Puno', '987654327', '2023-08-17', 'Carlos Torres'),
('CL008', '10987654', 'Pedro Soto','D0019', 'Jr. Cusco', '987654328', '2023-08-18', 'Miguel Flores'),
('CL009', '98765432', 'Maria Flores','D0002', 'Av. Amazonas', '987654329', '2023-08-19', 'Rosa Gomez'),
('CL010', '87654320', 'Javier Torres','D0003', 'Av. La Marina', '987654330', '2023-08-20', 'Pedro Ramirez'),
('CL011', '76543209', 'Ana Ramirez','D0005', 'Calle Arequipa', '987654331', '2023-08-21', 'Laura Chavez'),
('CL012', '65432108', 'Carlos Flores','D0007', 'Av. Grau', '987654332', '2023-08-22', 'Juan Torres'),
('CL013', '54321097', 'Laura Gomez','D0001', 'Jr. Lima', '987654333', '2023-08-23', 'Luis Perez'),
('CL014', '43210986', 'Juan Chavez','D0006', 'Calle Puno', '987654334', '2023-08-24', 'Ana Soto'),
('CL015', '32109875', 'Rosa Ramirez','D0015', 'Av. Huancayo', '987654335', '2023-08-25', 'Pedro Torres'),
('CL016', '21098764', 'Miguel Torres','D0011', 'Jr. Amazonas', '987654336', '2023-08-26', 'Maria Ramirez'),
('CL017', '10987653', 'Luis Soto','D0010', 'Av. Cusco', '987654337', '2023-08-27', 'Carlos Flores'),
('CL018', '98765431', 'Pedro Gomez','D0020', 'Calle La Marina', '987654338', '2023-08-28', 'Rosa Torres'),
('CL019', '87654319', 'Maria Soto','D0005', 'Av. Arequipa', '987654339', '2023-08-29', 'Javier Ramirez'),
('CL020', '76543208', 'Javier Flores','D0009', 'Jr. Grau', '987654340', '2023-08-30', 'Laura Soto');

select *from TB_CLIENTE 


INSERT INTO TB_PROVEEDOR (COD_PROV, RAZON_SOC_PROV, DIRECCION_PROV, TELEFONO_PROV, COD_DIST)
VALUES
('PR001','Consorsio SAC','Av. Arequipa','987654321','D0001'),
('PR002', 'Alimentos Ricos S.A.', 'Calle Lima', '987654322','D0002'),
('PR003', 'Proveedores de Granos EIRL', 'Jr. Huancayo', '987654323','D0003'),
('PR004', 'Distribuidora de Carnes S.R.L.', 'Av. Brasil', '987654324','D0004'),
('PR005', 'Suministros del Campo SAC', 'Jr. Puno', '987654325','D0005'),
('PR006', 'Insumos Naturales E.I.R.L.', 'Av. La Marina', '987654326','D0006'),
('PR007', 'Harinas y Cereales S.A.C.', 'Calle Tacna', '987654327','D0007'),
('PR008', 'Productos del Mar EIRL', 'Jr. Amazonas', '987654328','D0008'),
('PR009', 'Agr�cola San Juan SAC', 'Av. Cusco', '987654329','D0009'),
('PR010', 'Alimentos Saludables S.A.', 'Jr. Grau', '987654330','D0010'),
('PR011', 'Semillas y Granos S.A.C.', 'Calle Puno', '987654331','D0011'),
('PR012', 'Proveedora de Frutas EIRL', 'Av. Huancayo', '987654332','D0012'),
('PR013', 'Distribuidora de L�cteos S.R.L.', 'Jr. Tacna', '987654333','D0013'),
('PR014', 'Carnicer�a Selecta S.A.C.', 'Av. Puno', '987654334','D0014'),
('PR015', 'Insumos para Panader�a S.A.', 'Jr. La Paz', '987654335','D0015'),
('PR016', 'Agr�cola y Pesquera Los Andes SAC', 'Av. Grau', '987654336','D0016'),
('PR017', 'Productos Gourmet EIRL', 'Calle Amazonas', '987654337','D0017'),
('PR018', 'Fertilizantes y Abonos S.A.C.', 'Jr. Lima', '987654338','D0018'),
('PR019', 'Distribuidora de Especias S.R.L.', 'Av. La Marina', '987654339','D0019'),
('PR020', 'Comestibles del Valle SAC', 'Calle Tacna', '987654340','D0020');

select *from TB_PROVEEDOR


INSERT INTO TB_CATEGORIAS(COD_CAT, NOMBRE, DESCRIPCION) 
VALUES 
('CT001', 'ABARROTES', 'Arroz, Pasta, Aceites, Enlatados, Menestras'),
('CT002', 'BEBIDAS','Agua embotellada , Refrescos,Jugos, Bebidas alcolicas'),
('CT003', 'SNACKS', 'Papas fritas, Frutos secos, Galletas'),
('CT004', 'CUIDADO PERSONAL', 'Jabones, Champ�s, Pasta dental'),
('CT005', 'L�CTEOS', 'Leche, Queso, Yogurt'),
('CT006', 'CARNES', 'Pollo, Carne de res, Pescado'),
('CT007', 'PRODUCTOS ORG�NICOS', 'Frutas y verduras org�nicas'),
('CT008', 'CONGELADOS', 'Vegetales congelados, Helados'),
('CT009', 'ART�CULOS DE LIMPIEZA', 'Detergentes, Limpiadores, Art�culos de papel'),
('CT010', 'CONDIMENTOS', 'Sal, Pimienta, Especias diversas'),
('CT011', 'ART�CULOS DE COCINA', 'Fosforo, bela'),
('CT012', 'MASCOTAS', 'Comida para perros, Arena para gatos, Juguetes');

select *from TB_CATEGORIAS 


INSERT INTO TB_ORDEN_COMPRA(NUM_ORC, FECHA_ORC, COD_PROV, FECHA_ATE, ESTADO_ORC) 
VALUES 
('OC001','2023-11-07','PR005','2023-11-09','1'),
('OC002','2023-11-06','PR008','2023-11-08','2'),
('OC003','2023-11-05','PR012','2023-11-10','1'),
('OC004','2023-11-04','PR004','2023-11-11','2'),
('OC005','2023-11-03','PR020','2023-11-12','1'),
('OC006','2023-11-02','PR011','2023-11-13','2'),
('OC007','2023-11-01','PR016','2023-11-14','1'),
('OC008','2023-10-31','PR003','2023-11-15','3'),
('OC009','2023-10-30','PR007','2023-11-16','1'),
('OC010','2023-10-29','PR018','2023-11-17','1'),
('OC011','2023-10-28','PR010','2023-11-18','1'),
('OC012','2023-10-27','PR002','2023-11-19','2'),
('OC013','2023-10-26','PR015','2023-11-20','1'),
('OC014','2023-10-25','PR006','2023-11-21','2'),
('OC015','2023-10-24','PR013','2023-11-22','1'),
('OC016','2023-10-23','PR009','2023-11-23','3'),
('OC017','2023-10-22','PR019','2023-11-24','1'),
('OC018','2023-10-21','PR001','2023-11-25','2'),
('OC019','2023-10-20','PR017','2023-11-26','1'),
('OC020','2023-10-19','PR014','2023-11-27','2'),
('OC021','2023-10-18','PR005','2023-11-28','1'),
('OC022','2023-10-17','PR008','2023-11-29','1'),
('OC023','2023-10-16','PR012','2023-11-30','1'),
('OC024','2023-10-15','PR004','2023-12-01','2'),
('OC025','2023-10-14','PR020','2023-12-02','1'),
('OC026','2023-10-13','PR011','2023-12-03','2'),
('OC027','2023-10-12','PR016','2023-12-04','1'),
('OC028','2023-10-11','PR003','2023-12-05','1'),
('OC029','2023-10-10','PR007','2023-12-06','1'),
('OC030','2023-10-09','PR018','2023-12-07','3');

select *from TB_ORDEN_COMPRA 

INSERT INTO TB_BOLETA(NUM_BOL,FECHA_BOL,COD_CLI,COD_EMPLE,ESTADO_BOL,PORC_IGV_BOL) 
VALUES 
('B0001', '2023-07-11', 'CL005', 'EM001', '1', 0), 
('B0002', '2023-07-10', 'CL012', 'EM002', '1', 0),
('B0003', '2023-07-09', 'CL008', 'EM003', '1', 0),
('B0004', '2023-07-08', 'CL015', 'EM004', '1', 0),
('B0005', '2023-07-07', 'CL007', 'EM005', '1', 0),
('B0006', '2023-07-06', 'CL019', 'EM006', '1', 0),
('B0007', '2023-07-05', 'CL010', 'EM007', '1', 0),
('B0008', '2023-07-04', 'CL013', 'EM008', '1', 0),
('B0009', '2023-07-03', 'CL002', 'EM009', '1', 0),
('B0010', '2023-07-02', 'CL016', 'EM001', '1', 0),
('B0011', '2023-07-01', 'CL009', 'EM001', '1', 0),
('B0012', '2023-06-30', 'CL003', 'EM001', '1', 0),
('B0013', '2023-06-29', 'CL017', 'EM003', '1', 0),
('B0014', '2023-06-28', 'CL006', 'EM004', '1', 0),
('B0015', '2023-06-27', 'CL014', 'EM005', '1', 0),
('B0016', '2023-06-26', 'CL011', 'EM010', '1', 0),
('B0017', '2023-06-25', 'CL018', 'EM010', '1', 0),
('B0018', '2023-06-24', 'CL001', 'EM010', '1', 0),
('B0019', '2023-06-23', 'CL020', 'EM010', '1', 0),
('B0020', '2023-06-22', 'CL004', 'EM006', '1', 0),
('B0021', '2023-06-21', 'CL001', 'EM001', '1', 0),
('B0022', '2023-06-20', 'CL002', 'EM002', '1', 0),
('B0023', '2023-06-19', 'CL003', 'EM003', '1', 0),
('B0024', '2023-06-18', 'CL002', 'EM004', '1', 0),
('B0025', '2023-06-17', 'CL005', 'EM005', '1', 0),
('B0026', '2023-06-16', 'CL016', 'EM006', '1', 0),
('B0027', '2023-06-15', 'CL017', 'EM007', '1', 0),
('B0028', '2023-06-14', 'CL018', 'EM008', '1', 0),
('B0029', '2023-06-13', 'CL019', 'EM009', '1', 0),
('B0030', '2023-06-12', 'CL020', 'EM001', '1', 0),
('B0031', '2023-06-11', 'CL011', 'EM001', '1', 0),
('B0032', '2023-06-10', 'CL012', 'EM002', '1', 0),
('B0033', '2023-06-09', 'CL013', 'EM003', '1', 0),
('B0034', '2023-06-08', 'CL014', 'EM004', '1', 0),
('B0035', '2023-06-07', 'CL015', 'EM005', '1', 0),
('B0036', '2023-06-06', 'CL016', 'EM006', '1', 0),
('B0037', '2023-06-05', 'CL017', 'EM007', '1', 0),
('B0038', '2023-06-04', 'CL018', 'EM008', '1', 0),
('B0039', '2023-06-03', 'CL019', 'EM009', '1', 0),
('B0040', '2023-06-02', 'CL020', 'EM010', '1', 0),
('B0041', '2023-06-01', 'CL011', 'EM001', '1', 0),
('B0042', '2023-05-31', 'CL012', 'EM001', '1', 0),
('B0043', '2023-05-30', 'CL003', 'EM003', '1', 0),
('B0044', '2023-05-29', 'CL004', 'EM004', '1', 0),
('B0045', '2023-05-28', 'CL005', 'EM005', '1', 0),
('B0046', '2023-05-27', 'CL006', 'EM006', '1', 0),
('B0047', '2023-05-26', 'CL007', 'EM007', '1', 0),
('B0048', '2023-05-25', 'CL011', 'EM008', '1', 0),
('B0049', '2023-05-24', 'CL010', 'EM009', '1', 0),
('B0050', '2023-05-23', 'CL001', 'EM010', '1', 0);

select *from TB_BOLETA

INSERT INTO TB_PRODUCTO(COD_PRO, DESC_PRO, PRECIO_PRO, STOCK_MIN, STOCK_ACT, UNIDAD_MED, FECHA_VENC, COD_CAT) 
VALUES
('P0001','AGUA MINERAL',2.50,5,10,'UND','2024-01-02','CT002'),
('P0002','ARROZ',5.50,5,10,'KG','2024-01-02','CT001'),
('P0003','BEBEDEROS',5.50,5,10,'UND','2024-01-02','CT012'),
('P0004','AZUCAR',4.50,5,10,'KG','2024-02-02','CT001'),
('P0005','ACEITE',13.50,5,10,'KG','2025-01-02','CT001'),
('P0006','SAL',0.70,4,12,'KG','2025-01-02','CT001'),
('P0007','TALLARIN',6.00,4,12,'KG','2026-01-02','CT001'),
('P0008','ATUN',5.50,4,12,'KG','2024-05-02','CT001'),
('P0009','FILETE',6.50,2,12,'KG','2024-02-02','CT001'),
('P0010','AJINO',1.50,2,24,'KG','2025-01-02','CT001'),
('P0011','CONDIMENTOS',2.50,4,12,'KG','2024-06-02','CT001'),
('P0012','VERDURAS',1.50,5,24,'KG','2023-12-31','CT001'),
('P0013','AGUA MINERAL',2.50,5,10,'UND','2024-02-02','CT002'),
('P0014','REHIDRATNTE',2.50,5,10,'UND','2024-02-02','CT002'),
('P0015','GASEOSA',3.00,4,24,'UND','2025-02-02','CT002'),
('P0016','ENERGIZANTE',5.00,5,10,'UND','2025-02-02','CT002'),
('P0017','VINOS',16.50,6,24,'UND','2027-02-02','CT002'),
('P0018','CERVEZA',6.00,6,12,'UND','2026-02-02','CT002'),
('P0019','RON',24.50,4,12,'UND','2027-02-02','CT002'),
('P0020','PISCO',20.50,4,12,'UND','2027-02-02','CT002'),
('P0021','WISKY',66.50,3,12,'UND','2028-02-02','CT002'),
('P0022','TEKILA',32.50,5,10,'UND','2028-02-02','CT002'),
('P0023','PAPAS LAYS',2.50,2,12,'UND','2025-01-01','CT003'),
('P0024','CHESSTRES',1.50,4,12,'UND','2025-01-01','CT003'),
('P0025','CAMOTES',6.50,2,12,'UND','2025-01-01','CT003'),
('P0026','CHIFLES',6.50,2,12,'UND','2025-01-01','CT003'),
('P0027','PIQUEOS MIX',6.50,2,12,'UND','2025-01-01','CT003'),
('P0028','VAINILLA',2.50,2,12,'UND','2024-01-01','CT003'),
('P0029','SODA',1.00,2,12,'UND','2024-01-01','CT003'),
('P0030','RICKS',1.50,2,12,'UND','2024-01-01','CT003'),
('P0031','RELLENITAS',1.00,2,12,'UND','2024-01-01','CT003'),
('P0032','ANIMALITOS',1.50,2,12,'UND','2024-01-01','CT003'),
('P0033','PROTEX',8.50,3,24,'UND','2025-01-01','CT004'),
('P0034','CAMAY',7.50,3,24,'UND','2025-01-01','CT004'),
('P0035','HENO DE PRAVIA',6.50,3,24,'UND','2025-01-01','CT004'),
('P0036','HEAD SHOULDERS',19.50,4,24,'UND','2026-01-01','CT004'),
('P0037','PANTENE',22.50,3,24,'UND','2026-01-01','CT004'),
('P0038','SAVILAL',18.50,3,24,'UND','2026-01-01','CT004'),
('P0039','COLGATE',13.50,2,12,'UND','2027-01-01','CT004'),
('P0040','KOLYNOS',8.50,3,12,'UND','2027-01-01','CT004'),
('P0041','DENTO',3.50,2,12,'UND','2026-01-01','CT004'),
('P0042','ORAL B',6.50,3,12,'UND','2026-01-01','CT004'),
('P0043','LECHE GLORIA',4.00,4,24,'UND','2024-01-01','CT005'),
('P0044','LECHE IDEAL',3.50,4,24,'UND','2024-01-01','CT005'),
('P0045','LECHE PURA VIDA',4.00,4,24,'UND','2024-01-01','CT005'),
('P0046','LECHE BONLE',5.50,4,24,'UND','2024-01-01','CT005'),
('P0047','QUESO PHILADELPHIA',13.50,4,12,'UND','2027-01-01','CT005'),
('P0048','QUESO BONLE',13.50,3,12,'UND','2027-01-01','CT005'),
('P0049','QUESO ANDINO',10.50,2,12,'UND','2027-01-01','CT005'),
('P0050','YOGURT PURA VIDA',8.50,3,12,'UND','2027-01-01','CT005'),
('P0051','YOGURT LAIVE',3.50,2,12,'UND','2026-01-01','CT005'),
('P0052','YOGURT GLORIA B',6.50,3,12,'UND','2026-01-01','CT005'),
('P0053','POLLO PERLA',14.50,2,6,'KG','2024-12-01','CT006'),
('P0054','POLLO CRIOLLO',24.50,2,6,'KG','2024-12-01','CT006'),
('P0055','PATO',15.50,2,6,'KG','2024-12-01','CT006'),
('P0056','BISTECK',15.50,4,12,'KG','2024-12-01','CT006'),
('P0057','LOMO',22.50,4,12,'KG','2024-12-01','CT006'),
('P0058','CARNE MOLIDA',15.50,4,12,'KG','2024-12-01','CT006'),
('P0059','PEJERREY',10.50,2,6,'KG','2024-12-01','CT006'),
('P0060','BONITO',10.50,2,6,'KG','2024-12-01','CT006'),
('P0061','CABALLA',10.50,2,6,'KG','2024-12-01','CT006'),
('P0062','TOLLO',10.50,2,6,'KG','2024-12-01','CT006'),
('P0063','MANZANA CHILENA',8.50,3,24,'KG','2024-12-01','CT007'),
('P0064','MANZANA VERDE',7.50,3,24,'KG','2024-12-01','CT007'),
('P0065','UVAS ROJAS',6.50,3,24,'KG','2024-01-01','CT007'),
('P0066','UVAS VERDES',6.50,3,24,'KG','2024-01-01','CT007'),
('P0067','MANDARINA',3.50,3,24,'KG','2024-01-01','CT007'),
('P0068','NARANJA',10.50,3,24,'KG','2024-01-01','CT007'),
('P0069','ROCOTO',8.50,2,12,'KG','2024-01-01','CT007'),
('P0070','PRIMIENTO',5.50,3,12,'KG','2024-01-01','CT007'),
('P0071','LECHUGA',6.50,2,12,'KG','2024-01-01','CT007'),
('P0072','TOMATE',3.50,3,12,'KG','2024-01-01','CT007'),
('P0073','ZANAHORIA',3.50,3,24,'UND','2024-01-01','CT008'),
('P0074','APIO',2.50,3,24,'UND','2024-01-01','CT008'),
('P0075','NABO',2.50,3,24,'UND','2024-01-01','CT008'),
('P0076','VETERRAGA',3.50,4,24,'UND','2024-01-01','CT008'),
('P0077','PEPIMILLO',2.50,3,24,'UND','2024-01-01','CT008'),
('P0078','HELADO FRESA',10.50,3,24,'UND','2024-06-01','CT008'),
('P0079','HELADO LUCUMA',10.50,2,12,'UND','2024-06-01','CT008'),
('P0080','HELADO CHOCOLATE',10.50,3,12,'LT','2024-04-01','CT008'),
('P0081','HELADO VAINILLA',10.50,3,12,'LT','2024-06-01','CT008'),
('P0082','HELADO COCO',10.50,3,12,'LT','2024-06-01','CT008'),
('P0083','ARIEL',8.50,3,24,'KG','2025-01-01','CT009'),
('P0084','ACE',9.50,3,24,'KG','2025-01-01','CT009'),
('P0085','OPAL',8.50,3,24,'KG','2025-01-01','CT009'),
('P0086','PATITO',3.50,4,24,'KG','2025-01-01','CT009'),
('P0087','AYUDIN',5.50,3,24,'UND','2026-01-01','CT009'),
('P0088','SAPOLIO',3.50,3,24,'UND','2026-01-01','CT009'),
('P0089','CIF',10.50,2,12,'UND','2026-01-01','CT009'),
('P0090','ELITE',4.50,3,12,'UND','2027-01-01','CT009'),
('P0091','SUAVE',3.50,2,12,'UND','2027-01-01','CT009'),
('P0092','NOBLE',2.50,3,12,'UND','2027-01-01','CT009'),
('P0093','SAL FINA',1.50,3,12,'UND','2025-01-01','CT010'),
('P0094','SAL GRUESA',2.50,3,12,'UND','2025-01-01','CT010'),
('P0095','PIMIENTA',1.50,3,12,'UND','2025-01-01','CT010'),
('P0096','COMINO',1.50,4,12,'UND','2025-01-01','CT010'),
('P0097','PANCA',1.50,3,12,'UND','2025-01-01','CT010'),
('P0098','PALILLO',1.50,3,12,'UND','2025-01-01','CT010'),
('P0099','GENGIBRE',3.50,3,12,'UND','2025-01-01','CT010'),
('P0100','PAPRIKA',5.50,3,12,'UND','2025-01-01','CT010'),
('P0101','SALSA OSTION',8.50,2,12,'UND','2025-01-01','CT010'),
('P0102','CURCUMA',5.50,3,12,'UND','2025-01-01','CT010'),
('P0103','FOSFORO INTI',1.00,3,12,'UND','2025-01-01','CT011'),
('P0104','ENCENDEDOR',5.50,2,12,'UND','2025-01-01','CT011'),
('P0105','BRILLADOR',3.50,3,12,'UND','2025-01-01','CT011'),
('P0106','BOLSAS DE BASURA',10.50,2,24,'UND','2026-01-01','CT011'),
('P0107','VELA',1.00,3,12,'UND','2026-01-01','CT011'),
('P0108','TOALLA SECADOR',10.50,3,24,'UND','2026-01-01','CT011'),
('P0109','CUBIERTOS',18.50,2,12,'UND','2027-01-01','CT011'),
('P0110','OLLAS',35.50,3,12,'UND','2027-01-01','CT011'),
('P0111','SARTENES',25.50,2,12,'UND','2026-01-01','CT011'),
('P0112','CUCHARONES',10.50,3,12,'UND','2026-01-01','CT011'),
('P0113','RICO CAN',10.50,3,24,'KG','2026-01-01','CT012'),
('P0114','BABY CAN',9.50,3,24,'KG','2026-01-01','CT012'),
('P0115','PEDIGRI',12.50,3,24,'KG','2026-01-01','CT012'),
('P0116','MIMASKOT',10.50,4,24,'KG','2026-01-01','CT012'),
('P0117','CATCHOW',22.50,3,24,'KG','2026-01-01','CT012'),
('P0118','COLLARES',5.50,3,24,'UND','2026-01-01','CT012'),
('P0119','ROPAS',25.50,2,12,'UND','2027-01-01','CT012'),
('P0120','ARENA',15.50,3,12,'UND','2027-01-01','CT012'),
('P0121','PLATOS',3.50,2,12,'UND','2027-01-01','CT012'),
('P0122','BEBEDEROS',3.50,3,12,'UND','2027-01-01','CT012');

select *from TB_PRODUCTO 


INSERT INTO TB_DETALLE_BOLETA(NUM_BOL,COD_PRO,CANTIDAD_VEN,PRECIO_VEN) 
VALUES 
('B0001', 'P0001', 5, 3.0),
('B0002', 'P0002', 3, 6.5),
('B0003', 'P0003', 2, 6.0),
('B0004', 'P0004', 1, 5.0),
('B0005', 'P0005', 4, 2.25),
('B0006', 'P0006', 2, 6.0),
('B0007', 'P0007', 3, 5.0),
('B0008', 'P0008', 1, 8.0),
('B0009', 'P0009', 4, 3.75),
('B0010', 'P0010', 2, 6.5),
('B0011', 'P0011', 3, 4.0),
('B0012', 'P0012', 5, 2.0),
('B0013', 'P0013', 1, 9.0),
('B0014', 'P0014', 2, 7.5),
('B0015', 'P0015', 3, 5.25),
('B0016', 'P0016', 4, 3.2),
('B0017', 'P0017', 2, 6.75),
('B0018', 'P0018', 1, 8.5),
('B0019', 'P0019', 3, 5.5),
('B0020', 'P0020', 4, 3.5),
('B0021', 'P0021', 5, 2.8),
('B0022', 'P0022', 2, 6.25),
('B0023', 'P0023', 3, 4.5),
('B0024', 'P0024', 1, 9.5),
('B0025', 'P0025', 4, 3.0),
('B0026', 'P0026', 3, 4.75),
('B0027', 'P0027', 2, 7.25),
('B0028', 'P0028', 1, 10.5),
('B0029', 'P0029', 4, 2.5),
('B0030', 'P0030', 2, 6.25),
('B0031', 'P0031', 3, 5.5),
('B0032', 'P0032', 1, 8.75),
('B0033', 'P0033', 4, 3.5),
('B0034', 'P0034', 2, 6.75),
('B0034', 'P0035', 3, 4.25),
('B0036', 'P0036', 5, 2.15),
('B0037', 'P0037', 1, 9.25),
('B0038', 'P0038', 2, 7.75),
('B0039', 'P0039', 3, 5.75),
('B0040', 'P0040', 4, 3.75),
('B0041', 'P0041', 2, 6.95),
('B0042', 'P0042', 1, 8.25),
('B0043', 'P0043', 3, 5.25),
('B0044', 'P0044', 4, 3.25),
('B0045', 'P0045', 5, 2.85),
('B0046', 'P0046', 2, 6.45),
('B0047', 'P0047', 3, 4.75),
('B0048', 'P0048', 1, 9.75),
('B0049', 'P0049', 4, 3.15),
('B0050', 'P0050', 2, 7.0);

select *from TB_DETALLE_BOLETA

INSERT INTO TB_DETALLES_COMPRA(NUM_ORC,COD_PRO, CANTIDAD_PED) 
VALUES 
('OC001', 'P0001', 5),
('OC002', 'P0003', 20),
('OC003', 'P0004', 30),
('OC004', 'P0005', 20),
('OC005', 'P0006', 10),
('OC006', 'P0007', 13),
('OC007', 'P0008', 11),
('OC008', 'P0009', 14),
('OC009', 'P0010', 12),
('OC010', 'P0011', 13),
('OC011', 'P0012', 15),
('OC012', 'P0013', 11),
('OC013', 'P0014', 12),
('OC014', 'P0015', 13),
('OC015', 'P0016', 14),
('OC016', 'P0017', 12),
('OC017', 'P0018', 11),
('OC018', 'P0019', 13),
('OC019', 'P0020', 14),
('OC020', 'P0021', 15),
('OC021', 'P0022', 12),
('OC022', 'P0023', 13),
('OC023', 'P0024', 11),
('OC024', 'P0025', 14),
('OC025', 'P0026', 12),
('OC026', 'P0027', 13),
('OC027', 'P0028', 11),
('OC028', 'P0029', 14),
('OC029', 'P0030', 12),
('OC030', 'P0002', 13);

select *from TB_DETALLES_COMPRA
select *from TB_ORDEN_COMPRA
select *from TB_PRODUCTO

INSERT INTO TB_ABASTECIMIENTO(COD_PROV,COD_PRO,PRECIO_ABA) 
VALUES 
('PR001', 'P0001', 2.00),
('PR002', 'P0002', 3.50),
('PR003', 'P0003', 2.75),
('PR004', 'P0004', 5.00),
('PR005', 'P0005', 4.25),
('PR006', 'P0006', 6.00),
('PR007', 'P0007', 2.90),
('PR008', 'P0008', 7.50),
('PR009', 'P0009', 3.25),
('PR010', 'P0010', 4.75),
('PR011', 'P0011', 6.50),
('PR012', 'P0012', 8.00),
('PR013', 'P0013', 4.50),
('PR014', 'P0014', 5.75),
('PR015', 'P0015', 3.80),
('PR016', 'P0016', 2.60),
('PR017', 'P0017', 7.25),
('PR018', 'P0018', 6.75),
('PR019', 'P0019', 5.50),
('PR020', 'P0020', 3.50);

select *from TB_ABASTECIMIENTO
select *from TB_PROVEEDOR
select *from TB_PRODUCTO
