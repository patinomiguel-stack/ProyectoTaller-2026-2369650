-- Creación de la base de datos para RigCheck
CREATE DATABASE IF NOT EXISTS rigcheck_db;
USE rigcheck_db;

-- 1. Tabla de Procesadores (CPUs)
CREATE TABLE cpus (
    id_cpu INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    socket VARCHAR(20) NOT NULL, -- Ej: 'AM5', 'LGA1700'
    consumo_watts INT NOT NULL,
    power_score INT NOT NULL,    -- Puntaje para cálculo de bottleneck (1-100)
    precio_col COPES DECIMAL(12,2) -- Localización: Precio en pesos colombianos
);

-- 2. Tabla de Placas Base (Motherboards)
CREATE TABLE motherboards (
    id_mobo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    socket VARCHAR(20) NOT NULL, -- Debe coincidir con el de la CPU
    formato VARCHAR(10) NOT NULL, -- Ej: ATX, Micro-ATX
    precio_col COPES DECIMAL(12,2)
);

-- 3. Tabla de Tarjetas Gráficas (GPUs)
CREATE TABLE gpus (
    id_gpu INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    vram_gb INT NOT NULL,
    consumo_min_fuente INT NOT NULL, -- Watts mínimos recomendados
    power_score INT NOT NULL,        -- Puntaje para balanceo de potencia
    precio_col COPES DECIMAL(12,2)
);

-- 4. Tabla de Compatibilidad (Opcional para reglas específicas)
-- Permite que el sistema explique el "por qué" de una incompatibilidad[cite: 59].
CREATE TABLE reglas_compatibilidad (
    id_regla INT AUTO_INCREMENT PRIMARY KEY,
    componente_a VARCHAR(50),
    componente_b VARCHAR(50),
    descripcion_error TEXT
);