-- scripts/dmv_diagnostics.sql
-- Requêtes pour identifier requêtes couteuses
SELECT TOP 10
  qs.total_elapsed_time/qs.execution_count AS avg_elapsed,
  qs.execution_count,
  SUBSTRING(qt.text, (qs.statement_start_offset/2)+1,
    ((CASE qs.statement_end_offset WHEN -1 THEN DATALENGTH(qt.text) ELSE qs.statement_end_offset END
      - qs.statement_start_offset)/2)+1) AS statement_text,
  qp.query_plan
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp
ORDER BY avg_elapsed DESC;
GO
