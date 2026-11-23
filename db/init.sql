-- ============================================================
--  Script de inicialización de la base de datos "inventario"
--  MySQL lo ejecuta automáticamente SOLO la primera vez,
--  cuando el volumen datos_mysql está vacío.
-- ============================================================

SET NAMES utf8mb4;
USE inventario;

CREATE TABLE IF NOT EXISTS equipos (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    tipo           ENUM('Laptop','Escáner','Impresora térmica','Switch','Access Point','Tablet','Servidor','Otro') NOT NULL,
    marca          VARCHAR(50)  NOT NULL,
    numero_serie   VARCHAR(50)  NOT NULL UNIQUE,
    ubicacion      VARCHAR(100) NOT NULL,
    estado         ENUM('Disponible','Asignado en línea','Asignado a oficina','En mantenimiento','En garantía','Dado de baja') NOT NULL DEFAULT 'Disponible',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registros de ejemplo (Departamento de IT - SEIS)
INSERT INTO equipos (nombre, tipo, marca, numero_serie, ubicacion, estado) VALUES
('Laptop corporativa Ingeniería', 'Laptop', 'Dell', 'IT-LPT-101', 'Oficina Ingeniería', 'Asignado a oficina'),
('Escáner inalámbrico Línea 1', 'Escáner', 'Zebra', 'IT-SCN-204', 'Línea de Ensamble 1', 'Asignado en línea'),
('Impresora térmica de etiquetas', 'Impresora térmica', 'Zebra', 'IT-PRT-302', 'Taller de Soporte IT', 'En mantenimiento'),
('Switch administrable 24p', 'Switch', 'Cisco', 'IT-SWC-401', 'Site Principal IT', 'Disponible'),
('Tablet industrial de piso', 'Tablet', 'Honeywell', 'IT-TAB-509', 'Almacén de Garantías', 'En garantía'),
('Access Point industrial', 'Access Point', 'Aruba', 'IT-ACC-602', 'Almacén IT', 'Disponible'),
('Laptop corporativa Soporte', 'Laptop', 'Lenovo', 'IT-LPT-108', 'Almacén IT', 'Disponible'),
('Escáner de uso rudo', 'Escáner', 'Honeywell', 'IT-SCN-210', 'Bodega de Bajas', 'Dado de baja');
