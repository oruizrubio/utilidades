set linesize 500
SELECT vh.sid locking_sid,
 vs.username username,
 vs.osuser, 
 vs.status status,
 vs.module module,
 vs.program program,
 vs.machine machine,
 jrh.job_name,
 vw.sid waiter_sid,
 vsw.username waiter_username,
 vsw.osuser waiter_osuser,
 vsw.program waiter_program,
 vsw.machine waiter_machine,
 jrw.job_name waiter_job,
 'alter system kill session ' || ''''|| vh.sid || ',' || vs.serial# || ''';'  "Kill_Command"
FROM v$lock vh,
 v$lock vw,
 v$session vs,
 v$session vsw,
 dba_scheduler_running_jobs jrh,
 dba_scheduler_running_jobs jrw
WHERE     (vh.id1, vh.id2) IN (SELECT id1, id2
 FROM v$lock
 WHERE request = 0
 INTERSECT
 SELECT id1, id2
 FROM v$lock
 WHERE lmode = 0)
 AND vh.id1 = vw.id1
 AND vh.id2 = vw.id2
 AND vh.request = 0
 AND vw.lmode = 0
 AND vh.sid = vs.sid
 AND vw.sid = vsw.sid
 AND vh.sid = jrh.session_id(+)
 AND vw.sid = jrw.session_id(+);
