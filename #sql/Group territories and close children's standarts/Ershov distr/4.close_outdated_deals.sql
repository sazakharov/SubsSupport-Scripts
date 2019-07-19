-- Register of deals that must be closed
with
p as (
-- Date before which need to close the Deal
  select add_months(trunc(sysdate,'mm'), -18) dt_cutoff from dual
),
ass as (
select t.id_deal, t.actual_area.dt_end dt_end from (
  select ass.*, row_number() over (partition by ass.id_deal order by ass.actual_area.dt_end desc) n
    from t_assign ass
    where ass.actual_area.id_replace_user is null
) t, p where n = 1
      and t.actual_area.dt_end < p.dt_cutoff
)
select
    d.num_deal "Номер дела"
  , ass.dt_end "Дата закрытия"
  from t_deal d, ass
  where d.id_deal = ass.id_deal
    and d.dt_close is null
;



-- Close outdated deals
update t_deal d
  set dt_close = (
  ----------------
    with
    p as (
    -- Date before which need to close the Deal
      select add_months(trunc(sysdate,'mm'), -18) dt_cutoff from dual
    ),
    ass as (
    select t.id_deal, t.actual_area.dt_end dt_end from (
      select ass.*, row_number() over (partition by ass.id_deal order by ass.actual_area.dt_end desc) n
        from t_assign ass
        where ass.actual_area.id_replace_user is null
    ) t, p where n = 1
          and t.actual_area.dt_end < p.dt_cutoff
    )
    select dt_end from ass where ass.id_deal = d.id_deal
  ----------------
  )
  where dt_close is null
;  
