WITH ModelMonthCounts AS (
SELECT
        pd_model_name_adj,
        COUNT(DISTINCT report_date) AS month_count
    FROM
        score_v
    GROUP BY
        pd_model_name_adj
    HAVING
        COUNT(DISTINCT report_date) >= 6
),

RankedScores AS (
    SELECT
        sv.pd_model_name_adj,
        sv.basel_contract_id,
        sv.report_date,
        ROW_NUMBER() OVER (PARTITION BY sv.pd_model_name_adj ORDER BY sv.report_date DESC) AS rn
    FROM
        score_v sv
    INNER JOIN
        ModelMonthCounts mmc ON sv.pd_model_name_adj = mmc.pd_model_name_adj
),

FilteredScores AS (
    SELECT
        pd_model_name_adj,
        basel_contract_id,
        report_date
    FROM
        RankedScores
    WHERE
        rn <= 6
),

DefaultFlags AS (
    SELECT
        fs.pd_model_name_adj,
        fs.basel_contract_id,
        fs.report_date,
        pv.expect_default_flag  
    FROM
        FilteredScores fs
    LEFT JOIN 
        pd_v pv ON fs.basel_contract_id = pv.basel_contract_id AND fs.report_date = pv.report_date
    WHERE pv.expect_default_flag IS NOT NULL
),

AggregatedDefaults AS (
    SELECT
        pd_model_name_adj,
        COUNT(CASE WHEN expect_default_flag = TRUE THEN 1 END) AS default_count,
        COUNT(*) AS total_count,
        CAST(COUNT(CASE WHEN expect_default_flag = TRUE THEN 1 END) AS REAL) / COUNT(*) AS default_rate
    FROM
        DefaultFlags
    GROUP BY
        pd_model_name_adj
)
SELECT
    pd_model_name_adj,
    default_rate
FROM
    AggregatedDefaults
ORDER BY
    pd_model_name_adj;
