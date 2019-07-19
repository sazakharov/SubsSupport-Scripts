declare
l_parent_id number;
l_child_id number;
begin
select id_territory into l_parent_id from t_territory where moniker = 'Александровка';	
	select id_territory into l_child_id from t_territory where moniker = 'Березина Речка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Калашниково'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Кокурино'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Тепличный'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Рейник'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Водник'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Багаевка';	
	select id_territory into l_child_id from t_territory where moniker = 'Сельхозтехника'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Хмелевский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Вольновка';	
	select id_territory into l_child_id from t_territory where moniker = 'Тарханы'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Шевыревка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Сабуровка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '2-ая Расловка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Дубки';	
	select id_territory into l_child_id from t_territory where moniker = 'Клещевка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Новая Липовка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '1-Расловка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Красный Октябрь';	
select id_territory into l_parent_id from t_territory where moniker = 'Красный Текстильщик';	
	select id_territory into l_child_id from t_territory where moniker = 'Беленький'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Михайловка';	
	select id_territory into l_child_id from t_territory where moniker = 'Вязовка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Верхний Курдюм'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Ивановский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Колотов Буерак'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Константиновка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Новоалександровка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Сосновка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Юрловка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Юрьевка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Расково';	
	select id_territory into l_child_id from t_territory where moniker = 'Бартоломеевский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Зоринский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Малая Скатовка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Сокурский тракт'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Рыбушка';	
	select id_territory into l_child_id from t_territory where moniker = 'Поповка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '15 лет Октября'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Сбродовка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Синенькие';	
	select id_territory into l_child_id from t_territory where moniker = 'Бабановка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Сергиевский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Пудовкино'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Крутец'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Формосово'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Широкий Буерак'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = 'Соколовый';	
select id_territory into l_parent_id from t_territory where moniker = 'Усть-Курдюм';	
	select id_territory into l_child_id from t_territory where moniker = 'п.Новогусельский'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Мергичевка'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'п-т "Заря"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Пансионат "Заря"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'Пристанное'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = 'ЛОК "Волжские дали"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
end;
/

declare
    l_dt_close         DATE := to_date('01.10.2018','dd.mm.yyyy');
    l_district_moniker VARCHAR2(100) := 'Саратовский район';
    l_level            INTEGER := 3;
begin
    for r in (
        select id_pay_standart
          from t_pay_standart ps
          where id_territory in (
                select id_territory from (
                    select level l, lpad('    ', level)||t.moniker, id_territory
                      from t_territory t
                      connect by prior id_territory = id_parent
                      start with moniker = l_district_moniker
                  )
                  where l = 3  
                )
                and ps.actual_area.is_actual()='Y'
                and ps.e_pay_standart_kind in ('I','MRnO','MRyO','MT')
                and ps.actual_area.dt_beg < l_dt_close
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