<h1 align="center">Financial Budget vs Actual | FP&A Analysis</h1>

<p align="center">
  <b>Santiago Vázquez</b><br>
  Proyecto integral de análisis financiero enfocado en <b>Budget vs Actual / FP&A</b>, desarrollado para identificar desvíos presupuestarios, analizar sus principales focos y generar insights para la toma de decisiones.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Power_Query-ETL-42A06C" />
  <img src="https://img.shields.io/badge/PostgreSQL-Database-336791" />
  <img src="https://img.shields.io/badge/SQL-Financial_Analytics-lightgrey" />
  <img src="https://img.shields.io/badge/Power_BI-Dashboard-F2C811" />
  <img src="https://img.shields.io/badge/DAX-Financial_Metrics-FF7A61" />
</p>

---

## 📊 Dashboards

### 1. Executive Overview

Vista ejecutiva del desempeño presupuestario general, incluyendo Budget, Actual, Variance, Variance %, análisis por departamento, región y evolución temporal.

![Executive Overview](./images/executive_overview.png)

---

### 2. Detailed Analysis

Vista orientada a profundizar en la composición de los principales desvíos por categoría y departamento, junto con la evolución mensual de la Variance.

![Detailed Analysis](./images/detailed_analysis.png)

---

## 🎯 Objetivo del Análisis

Analizar la ejecución presupuestaria de una organización durante **2021–2023**, comparando Budget vs Actual e identificando desvíos por **departamento, categoría, región y período**.

El dataset final contiene **9.992 transacciones** luego del proceso de limpieza y transformación.

---

## 🔄 Flujo de Datos

`Raw Data` ➔ `Power Query` ➔ `PostgreSQL` ➔ `SQL` ➔ `Power BI + DAX`

1. **Power Query:** limpieza y transformación de los datos.
2. **PostgreSQL:** carga de información y construcción de un modelo estrella.
3. **SQL:** análisis de Budget, Actual, Variance y Variance %.
4. **Power BI + DAX:** modelado analítico, métricas financieras y dashboards interactivos.

<details>
  <summary><b>Ver detalle técnico del proyecto</b></summary>

### Transformación en Power Query

Se revisaron tipos de datos, registros duplicados, valores vacíos y consistencia de la información antes de exportar el dataset limpio.

![Power Query ETL](./images/power_query_etl.png)

### Modelado en PostgreSQL

A partir de la tabla de staging se construyó un **Star Schema** compuesto por una tabla de hechos y dimensiones de fecha, departamento, categoría, región y método de pago.

Las relaciones fueron implementadas mediante claves foráneas.

![SQL Foreign Keys](./images/sql_foreign_keys.png)

### Modelo de Datos

El modelo dimensional fue utilizado como base para el análisis y la construcción del reporte en Power BI.

![Data Model](./images/data_model.png)

### Análisis con SQL

Se desarrollaron consultas para responder preguntas como:

- ¿Cuál es el desvío total entre Budget y Actual?
- ¿Qué departamentos presentan los mayores desvíos?
- ¿Qué categorías concentran la mayor Variance?
- ¿Qué regiones presentan mayores diferencias?
- ¿Cómo evoluciona Budget vs Actual en el tiempo?
- ¿Qué departamentos presentan la mayor Variance %?

![SQL Analysis](./images/sql_analysis.png)

Las consultas completas se encuentran disponibles en la carpeta `sql/`.

### Medidas DAX

En Power BI se creó una tabla de medidas para calcular dinámicamente:

- Total Budget
- Total Actual
- Variance
- Variance %

Las métricas responden a los filtros aplicados por fecha, departamento y región.

![DAX Measures](./images/dax_measures.png)

</details>

---

## 📌 ¿Qué analiza cada dashboard?

### Executive Overview

Permite responder rápidamente:

- ¿Cuál es el Budget y Actual total?
- ¿Cuál es la Variance absoluta y porcentual?
- ¿Qué departamentos presentan mayores diferencias?
- ¿Qué regiones concentran los principales desvíos?
- ¿Cómo evoluciona Budget vs Actual en el tiempo?

### Detailed Analysis

Profundiza el análisis mediante:

- Budget vs Actual por categoría.
- Variance % por departamento.
- Variance por categoría.
- Evolución mensual de la Variance.

Los filtros por **fecha, departamento y región** permiten analizar dinámicamente distintos segmentos del negocio.

---

## 💡 Principales Insights

- La ejecución presenta una **Variance total de 79,39M**, equivalente a un **11,12% por encima del presupuesto**.
- Todos los departamentos, regiones y categorías analizadas presentan Actual superior al Budget.
- **Marketing** registra la mayor Variance % por departamento con **13,84%**, seguido por **HR con 13,34%**.
- **Salaries (17,3M)** y **Utilities (15,5M)** concentran más del **41% de la Variance total**.
- **East** presenta el mayor desvío regional con **17,7M**, mientras que **North** registra el menor con **14,3M**.
- **Diciembre de 2022** fue el mes con mayor Variance del período, con **5,240M**.

---

## 📈 Recomendaciones

- Revisar las premisas presupuestarias utilizando el comportamiento histórico como referencia.
- Priorizar el seguimiento de **Marketing, HR, Salaries y Utilities** por su mayor nivel de desvío.
- Monitorear periódicamente **Variance y Variance %** para detectar desviaciones con mayor anticipación.
- Analizar los períodos con mayores picos para identificar los factores detrás de esas variaciones.

---

## 🛠️ Herramientas

`Excel` · `Power Query` · `PostgreSQL` · `SQL` · `Power BI` · `DAX`

---

## 📂 Estructura del Repositorio

```text
Financial-Budget-vs-Actual/
│
├── data/
│   ├── financial_data_raw.xlsx
│   └── financial_data_clean.csv
│
├── sql/
│   ├── 01_crear_tablas.sql
│   ├── 02_cargar_dimensiones.sql
│   ├── 03_crear_tabla_hechos.sql
│   ├── 04_cargar_tabla_hechos.sql
│   ├── 05_agregar_claves_foraneas.sql
│   └── 06_analisis_negocio.sql
│
├── powerbi/
│   └── financial_budget_vs_actual_fp&a.pbix
│
├── images/
│   ├── power_query_etl.png
│   ├── sql_foreign_keys.png
│   ├── data_model.png
│   ├── sql_analysis.png
│   ├── dax_measures.png
│   ├── executive_overview.png
│   └── detailed_analysis.png
│
└── README.md
```
