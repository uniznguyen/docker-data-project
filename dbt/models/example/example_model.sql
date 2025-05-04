-- This is a SQL model for dbt that creates a simple example table.
-- Using a simple CTE with generated data instead of a non-existent table

WITH source_data AS (
    SELECT 1 as id, 'Example Name' as name, CURRENT_TIMESTAMP as created_at
)

SELECT
    id,
    name,
    created_at,
    CURRENT_TIMESTAMP AS transformed_at
FROM
    source_data