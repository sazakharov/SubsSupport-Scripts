-- Shift dt_init to begin of first assign after specified date
variable date_cutoff varchar2(10);
exec :date_cutoff := '01.07.2018';

declare
    i integer;
begin
    select count(1) into i from user_tables where table_name = 'T_TEMP_NUM';
    if i > 0 then
        execute immediate 'TRUNCATE TABLE T_TEMP_NUM';
        execute immediate 'DROP TABLE T_TEMP_NUM';
    end if;
    execute immediate '
CREATE GLOBAL TEMPORARY TABLE T_TEMP_NUM
(
  NUM1 NUMBER
, NUM2 NUMBER
, NUM3 NUMBER
, NUM4 NUMBER
, DT1 DATE DEFAULT null
)
ON COMMIT PRESERVE ROWS';
end;
/

insert into t_temp_num (num1, dt1)
--
      with ap_tree as (
      select level, decode(nvl(id_parent,0), 0,id_appeal, id_parent) global_id_appeal, ap.*
        from t_appeal ap
        connect by prior ap.ID_APPEAL = ap.ID_PARENT
        start with ap.id_parent is null
      )
      select id_deal, dt_beg
--      select min(dt_beg)
        from (
          select id_deal, global_id_appeal, dt_beg, dt_end, row_number() over (partition by id_deal order by dt_beg) i
            from (
              select ass.id_deal, apt.global_id_appeal, min(ass.actual_area.dt_beg) dt_beg, max(ass.actual_area.dt_end) dt_end
                from
                   ap_tree apt
                  ,t_assign ass
                where apt.id_appeal = ass.id_apeal
                  and ass.actual_area.id_replace_user is null
                  and ass.e_condition = 'Active'
                group by ass.id_deal, apt.global_id_appeal
                having min(ass.actual_area.dt_beg) >= nvl(to_date(:date_cutoff,'dd.mm.yyyy'), add_months(trunc(sysdate,'mm'),-12))
            )
        ) t
        where t.i = 1
;

update t_deal d
  set
    dt_init =  nvl(greatest(dt_init,( 
    ---------------------------------
      select dt1 from t_temp_num t
        where t.num1 = d.id_deal
    ---------------------------------
    )),trunc(sysdate,'mm'))
  where dt_close is null or dt_close > sysdate
;