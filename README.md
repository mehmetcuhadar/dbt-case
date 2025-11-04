# Gaming Analytics DBT Model

This project implements a data pipeline and analytics model for a mobile gaming dataset using dbt Cloud and Google BigQuery.
It demonstrates the core components of a modern analytics workflow: data ingestion, transformation, testing, and visualization.

## Tech Stack

**Warehouse**: BigQuery

**Transformation Tool**: dbt (Cloud)

**Visualization**: Looker Studio

## Pipeline Structure
### **1)** Raw Data

CSV files loaded into BigQuery under the dataset game_raw_data (in region europe-west1).

### **2)** dbt Staging Models (models/staging/)

Clean and standardize raw tables.

### **3)** dbt Mart Models (models/marts/)

Aggregate metrics into a fact table for visualization.

### **4)** Testing (schema.yml)

not_null and unique tests applied to key identifiers.

### **5)** Visualization

Modeled data is connected to Looker Studio for exploration and dashboarding.

# [`Dasboard Link`](https://lookerstudio.google.com/reporting/fe776154-8364-41d4-a14e-59c40eaa7123)
