-- Revise children's standarts with parents
with
childter as (
  select * from (
      select level l, lpad('    ', level)||t.moniker tername, t.moniker, id_territory, id_parent
        from t_territory t
        connect by prior id_territory = id_parent
        start with moniker = 'Ершовский район'
    )
    where l = 3  
)
select
     ct.moniker "Территория"
    ,(select name from t_enum_member em where key_enum = 'PAY_STANDART_KIND' and em.code = ps.e_pay_standart_kind) "Стандарт"
    ,(select name from t_enum_member em where key_enum = 'PAY_STANDART_FAMILY_SIZE' and em.code = ps.e_pay_standart) "Наименование"
    --, ps.e_pay_standart_kind, ps.e_pay_standart
    ,ps.value "Значение"
    ,ps.actual_area.dt_beg "Начало действия"
    ,ps.actual_area.dt_end "Конец действия"
    ,(select moniker from t_territory t where t.id_territory = ct.id_parent) "Территория МО"
    ,(        select ps2.value from t_pay_standart ps2
          where ps2.id_territory = ct.id_parent
            and ps2.e_pay_standart_kind = ps.e_pay_standart_kind
            and ps2.e_pay_standart = ps.e_pay_standart
            and ps2.actual_area.is_actual(ps.actual_area.dt_beg)='Y') "Значение МО"
  from childter ct, t_pay_standart ps
  where ct.id_territory = ps.id_territory
    and ps.actual_area.is_actual4period(to_date('01.10.2014','dd.mm.yyyy'), pk_actual_area.finish_date)='Y'
    and ps.e_pay_standart_kind in ('I','MRnO','MRyO','MT')
    and not exists (
        select 1 from t_pay_standart ps2
          where ps2.id_territory = ct.id_parent
            and ps2.e_pay_standart_kind = ps.e_pay_standart_kind
            and ps2.e_pay_standart = ps.e_pay_standart
            and ps2.actual_area.is_actual(ps.actual_area.dt_beg)='Y'
--            and ps2.value = ps.value
        )
  order by ct.id_parent, ps.e_pay_standart_kind,ps.e_pay_standart, ps.actual_area.dt_end desc