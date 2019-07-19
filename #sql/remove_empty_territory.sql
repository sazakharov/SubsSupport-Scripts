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
        'п. Богдашино',
        'с. Большеузенка',
        'Лопатин х',
        'ст. Мавринка ж/д',
        'с. Верхний узень',
        'п. Ветка',
        'п. Водный',
        'с. Мавринка',
        'с. Малый перелаз',
        'с. Ново-Ряженка',
        'ПГТ Новый (Липерсталь)',
        'п. Октябрьский',
        'п. Плодопитомник',
        'с. Светлое Озеро',
        'п. Ершовский с\з',
        'п. Трудовой',
        'п. Ягодинка',
        'Ершов',
        'Восточный'
        )
    -- и не существует Личных Счетов (Дел)
    and not exists (
        select 1 from bd, t_ls ls
          where bd.id_territory = t.id_territory
            and bd.id_building = ls.id_building
        )
