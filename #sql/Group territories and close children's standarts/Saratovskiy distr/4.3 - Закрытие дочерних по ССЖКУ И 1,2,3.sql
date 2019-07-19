declare
    l_dt_close         DATE := to_date('01.10.2018','dd.mm.yyyy');
    l_district_moniker VARCHAR2(100) := 'Саратовский район';
    l_level            INTEGER := 3;
begin
    for r in (
        select *
          from t_pay_standart ps
          where id_territory in (
                select id_territory from (
                    select level l, lpad('    ', level)||t.moniker, id_territory
                      from t_territory t
                      connect by prior id_territory = id_parent
                      start with moniker = 'Саратовский район'
                  )
                  where l = 3  
                )
                and ps.actual_area.is_actual()='Y'
                and ps.e_pay_standart_kind in ('I')
                and ps.e_pay_standart in ('I1','I2','I3')
    ) loop
        pk_owner.push_grant('t_pay_standart','I_AM_ABSOLUTELY_SURE_THAT_UPDATE_IS_CORRECT',r.id_pay_standart);
            update t_pay_standart ps
              set
                ps.actual_area.dt_end = l_dt_close,
                ps.actual_area.dtz_reg_end = sysdate,
                ps.actual_area.id_reg_end_user = 2
              where id_pay_standart = r.id_pay_standart
            ;
        pk_owner.pop_grant;
    end loop;
end;
/