declare
l_parent_id number;
l_child_id number;
begin
select id_territory into l_parent_id from t_territory where moniker = '�������������';	
	select id_territory into l_child_id from t_territory where moniker = '�������� �����'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '��������';	
	select id_territory into l_child_id from t_territory where moniker = '��������������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '���������';	
	select id_territory into l_child_id from t_territory where moniker = '�������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '2-�� ��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '�����';	
	select id_territory into l_child_id from t_territory where moniker = '��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����� �������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '1-��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '������� �������';	
select id_territory into l_parent_id from t_territory where moniker = '������� �����������';	
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '����������';	
	select id_territory into l_child_id from t_territory where moniker = '�������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������� ������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������� ������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��������������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�����������������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '�������';	
	select id_territory into l_child_id from t_territory where moniker = '���������������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����� ��������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��������� �����'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '�������';	
	select id_territory into l_child_id from t_territory where moniker = '�������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '15 ��� �������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '���������';	
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '���������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '������� ������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
select id_territory into l_parent_id from t_territory where moniker = '���������';	
select id_territory into l_parent_id from t_territory where moniker = '����-������';	
	select id_territory into l_child_id from t_territory where moniker = '�.��������������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '�-� "����"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��������� "����"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '����������'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
	select id_territory into l_child_id from t_territory where moniker = '��� "�������� ����"'; update t_territory set id_parent = l_parent_id where id_territory = l_child_id;
end;
/

declare
    l_dt_close         DATE := to_date('01.10.2018','dd.mm.yyyy');
    l_district_moniker VARCHAR2(100) := '����������� �����';
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