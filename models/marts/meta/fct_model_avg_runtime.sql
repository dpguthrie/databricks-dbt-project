with job_mon as (
   select * from {{ ref('fct_dlt_api_job_mon') }}
)
, 
history as (
select 
uniqueID, 
count(runid) as run_count,
avg(executionTime) as avg_execution_time,
max(executionTime) as max_execution_time,
min(executionTime) as min_execution_time 
from job_mon
group by uniqueID 
)
,
latest_run as (
    select 
    uniqueID,
    runid,
    executionTime as latest_execution_time
    from job_mon
    where runid = 
    (select max(runid) from job_mon)
)
, 
final as (
select 
h.uniqueID, 
h.run_count,
h.avg_execution_time,
h.max_execution_time,
h.min_execution_time,
l.latest_execution_time,
(l.latest_execution_time - h.avg_execution_time) as latest_diff
from history h join latest_run l 
on h.uniqueID = l.uniqueID
)


select 
* 
from final