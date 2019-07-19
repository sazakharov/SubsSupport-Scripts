-- Сдвиг Даты начала расчета на начало первого обращения в текущем году
----
update t_deal d
  set
    dt_init =  nvl(( 
--------
with ap_tree as (
select level, decode(nvl(id_parent,0), 0,id_appeal, id_parent) global_id_appeal, ap.* from t_appeal ap
  connect by prior ap.ID_APPEAL = ap.ID_PARENT
  start with ap.id_parent is null
)
select min(dt_beg) from (
select ass.id_deal, apt.global_id_appeal, min(ass.actual_area.dt_beg) dt_beg, max(ass.actual_area.dt_end) dt_end
  from
     ap_tree apt
    ,t_assign ass
  where apt.id_appeal = ass.id_apeal
    and ass.actual_area.is_actual4period(pk_actual_area.start_date,pk_actual_area.finish_date) = 'Y'
  group by ass.id_deal, apt.global_id_appeal
) t
where t.dt_beg > to_date('01.01.2018','dd.mm.yyyy')
--
  and t.id_deal = d.id_deal
---
),trunc(sysdate,'mm'))
  where dt_close is null or dt_close > sysdate
