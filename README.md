# Proyecto Capstone: Análisis Exploratorio de Datos (EDA) en PostgreSQL

##  Descripción del Problema de Negocio
Una plataforma de comercio electrónico busca optimizar su estrategia comercial mediante un análisis profundo de su base de datos transaccional. El objetivo principal es identificar patrones de comportamiento en los clientes, estacionalidad en las ventas, eficiencia del inventario de productos y distribución de ingresos por categoría para respaldar la toma de decisiones gerenciales.

---

##  Hallazgos Principales y Conclusiones Directivas

1. **Concentración de Ingresos (Top Clientes):**
   * El análisis demuestra que un segmento reducido de clientes lidera el volumen de compras (destacando clientes como Ana Pérez y Carlos Gómez). 
   * **Recomendación:** Diseñar un programa VIP automatizado que ofrezca envíos gratuitos y preventas exclusivas a este segmento para asegurar su retención a largo plazo.

2. **Comportamiento Estacional de Ventas:**
   * Se observa un crecimiento sostenido en el volumen de transacciones entre febrero y abril. Sin embargo, los picos están fuertemente atados a la categoría de tecnología ("Laptop Pro").
   * **Recomendación:** Diversificar las campañas promocionales hacia productos de hogar y oficina durante los meses de menor tracción para equilibrar los ingresos mensuales.

3. **Gestión de Inventario (Productos de Baja Rotación):**
   * Algunos accesorios presentan un índice de ventas muy bajo o nulo en comparación con los equipos principales.
   * **Recomendación:** Implementar estrategias de venta cruzada (*cross-selling*), ofreciendo estos productos como complementos con descuento al comprar artículos de mayor valor.

---

##  Pasos para Ejecutar el Código

1. **Configurar el entorno:**
   * Tener instalado **PostgreSQL** y una herramienta de gestión (como pgAdmin, DBeaver o la terminal `psql`).
   * Crear la base de datos ejecutando:
     ```sql
     CREATE DATABASE capstone_project;
     ```

2. **Cargar la estructura y los datos:**
   * Conéctate a la base de datos `capstone_project` y ejecuta el script contenido en el archivo `estructura.sql`. Esto creará las tablas y poblará los datos iniciales, incorporando reglas de limpieza con `COALESCE`.

3. **Ejecutar el análisis:**
   * Abre y ejecuta el archivo `analisis.sql` para generar las métricas de rendimiento y las consultas avanzadas con funciones de ventana.
