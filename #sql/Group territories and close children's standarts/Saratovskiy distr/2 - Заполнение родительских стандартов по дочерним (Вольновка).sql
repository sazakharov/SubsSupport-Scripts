declare
    l_id_pay_standart      t_pay_standart.id_pay_standart%TYPE;
    l_aa            ot_actual_area;
begin
    l_aa := ot_actual_area.get_draft_aa;        -- статус-черновик
    ------
    for r in (
    --------------------
with parent_standart as (
select ter.moniker , ter.id_territory, ps.e_pay_standart, max(ps.actual_area.dt_end) dt_end
  from t_pay_standart ps, t_territory ter
  where ps.id_territory = ter.id_territory
--    and ps.e_pay_standart_kind = 'I'
    and ter.id_parent = 2317
    and ps.actual_area.is_actual4period(pk_actual_area.start_date, pk_actual_area.finish_date) = 'Y'
    and exists (
        select 1
          from
             t_pay_standart ps2
            ,t_territory ter2
          where ps2.id_territory = ter2.id_territory
            and ter2.id_parent = ter.id_territory
    )
  group by ter.moniker, ter.id_territory, ps.e_pay_standart
  having max(ps.actual_area.dt_end) < sysdate
)
select parst.moniker, parst.id_territory , ps.e_pay_standart_kind , parst.e_pay_standart, parst.dt_end dt_end_parent, ter.moniker child_moniker, ps.VALUE, ps.actual_area.dt_beg dt_beg, ps.actual_area.dt_end dt_end
  from
     parent_standart parst
    ,t_pay_standart ps
    ,t_territory ter
  where parst.id_territory = ter.id_parent
    ---
    and ter.id_territory in (select id_territory from t_territory where moniker in ('Шевыревка'))
    --and ter.id_territory not in (select id_territory from t_territory where moniker in ('Пансионат "Заря"', 'Сабуровка'))
    --and ter.id_parent not in (select id_territory from t_territory where moniker in ('Усть-Курдюм'))
    ---
    and ter.id_territory = ps.id_territory
    and parst.e_pay_standart = ps.e_pay_standart
    and ps.actual_area.is_actual4period(parst.dt_end, pk_actual_area.finish_date) = 'Y'
  order by parst.moniker, parst.e_pay_standart, parst.dt_end, ps.actual_area.dt_beg, ter.moniker
    --------------------
    ) loop
        l_id_pay_standart := pk_id.get('t_pay_standart');
        insert into t_pay_standart
                    (id_pay_standart,     e_pay_standart,   id_territory,   e_pay_standart_kind,   value, actual_area)
             values
                    (l_id_pay_standart, r.e_pay_standart, r.id_territory, r.e_pay_standart_kind, r.value, l_aa);
        pk_actual_area.reg_beg ( 'pay_standart', l_id_pay_standart, FALSE, r.dt_beg, r.dt_end, NULL);
    end loop;
end;
/
