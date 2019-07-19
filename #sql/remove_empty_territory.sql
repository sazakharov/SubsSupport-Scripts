with
bd as (
  select * from (
    select bd.* , row_number() over (partition by bd.id_building order by bd.actual_area.dt_end desc) i
      from t_building_dossier bd
      where bd.actual_area.id_replace_user is null
  ) where i = 1
)
select *
  from t_territory t
  where t.moniker in (
        '�. ���������',
        '�. ������������',
        '������� �',
        '��. �������� �/�',
        '�. ������� �����',
        '�. �����',
        '�. ������',
        '�. ��������',
        '�. ����� �������',
        '�. ����-�������',
        '��� ����� (����������)',
        '�. �����������',
        '�. �������������',
        '�. ������� �����',
        '�. ��������� �\�',
        '�. ��������',
        '�. ��������',
        '�����',
        '���������'
        )
    -- � �� ���������� ������ ������ (���)
    and not exists (
        select 1 from bd, t_ls ls
          where bd.id_territory = t.id_territory
            and bd.id_building = ls.id_building
        )
