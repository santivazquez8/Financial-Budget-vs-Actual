# Financial Budget vs Actual | FP&A Analysis

Proyecto integral de análisis financiero enfocado en **Budget vs Actual / FP&A**, desarrollado para identificar desvíos presupuestarios, analizar sus principales drivers y generar insights para la toma de decisiones.

**Power Query · PostgreSQL · SQL · Power BI · DAX**

---

## Dashboard

### Executive Overview

![Executive Overview](images/executive_overview.png)

### Detailed Analysis

![Detailed Analysis](images/detailed_analysis.png)

---

## Objetivo

Analizar la ejecución presupuestaria de una organización durante **2021–2023**, comparando Budget vs Actual e identificando desvíos por **departamento, categoría, región y período**.

El dataset final utilizado contiene **9.992 transacciones** luego del proceso de limpieza y transformación.

---

## Proceso

**Raw Data → Power Query → PostgreSQL → SQL → Power BI**

- **Power Query:** limpieza, transformación, eliminación de duplicados y tratamiento de valores vacíos.
- **PostgreSQL:** carga de datos y construcción de un modelo estrella.
- **SQL:** análisis de Budget, Actual, Variance y Variance % desde distintas dimensiones.
- **Power BI + DAX:** modelado analítico, métricas financieras y desarrollo de dashboards interactivos.

### ETL

![Power Query ETL](images/power_query_etl.png)

### Modelo de datos

Se construyó un **Star Schema** con una tabla de hechos (`fact_financial_transactions`) y dimensiones de fecha, departamento, categoría, región y método de pago.

![Data Model](images/data_model.png)

---

## Análisis SQL

Las consultas SQL fueron desarrolladas para responder preguntas como:

- ¿Cuál es el desvío total entre Budget y Actual?
- ¿Qué departamentos presentan los mayores desvíos?
- ¿Qué categorías explican la mayor parte de la Variance?
- ¿Qué regiones concentran los mayores desvíos?
- ¿Cómo evoluciona Budget vs Actual a lo largo del tiempo?
- ¿Qué departamentos presentan la mayor Variance %?

![SQL Analysis](images/sql_analysis.png)

---

## ¿Qué analiza cada dashboard?

### Executive Overview

Vista ejecutiva orientada a responder rápidamente:

- ¿Cuál es el Budget y Actual total?
- ¿Cuál es la Variance absoluta y porcentual?
- ¿Qué departamentos presentan mayores diferencias?
- ¿Qué regiones concentran los principales desvíos?
- ¿Cómo evoluciona Budget vs Actual en el tiempo?

### Detailed Analysis

Vista orientada a profundizar en las causas del desvío:

- Budget vs Actual por categoría.
- Variance % por departamento.
- Variance absoluta por categoría.
- Evolución mensual de la Variance.

Los filtros por **fecha, departamento y región** permiten analizar dinámicamente distintos segmentos del negocio.

---

## Insights principales

- La ejecución presenta una **Variance total de 79,39M**, equivalente a un **11,12% por encima del presupuesto**.
- El desvío es generalizado: todos los departamentos, regiones y categorías analizadas presentan Actual superior al Budget.
- **Marketing** registra la mayor Variance % por departamento con **13,84%**, seguido por **HR con 13,34%**.
- **Salaries (17,3M)** y **Utilities (15,5M)** concentran más del **41% de la Variance total**.
- **East** presenta el mayor desvío regional con **17,7M**, mientras que **North** registra el menor con **14,3M**.
- **Diciembre de 2022** fue el mes con mayor Variance del período, con **5,240M**.

---

## Recomendaciones

- Revisar las premisas utilizadas en la elaboración del presupuesto utilizando el comportamiento histórico como referencia.
- Priorizar el seguimiento de **Marketing, HR, Salaries y Utilities**, por su mayor nivel de desvío.
- Implementar un monitoreo periódico de **Variance y Variance %** para detectar desviaciones con mayor anticipación.
- Profundizar el análisis de los meses con mayores picos para identificar sus drivers operativos.

---

## Herramientas

`Excel` · `Power Query` · `PostgreSQL` · `SQL` · `Power BI` · `DAX`

---

## Estructura del repositorio

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
│ 
│
└── README.md
```
