with
tn as (
  select id_ls, count(*) cnt from t_tenant_dossier td, t_tenant t
    where t.id_tenant = td.id_tenant
      and td.actual_area.is_actual() = 'Y'
    group by t.id_ls
--    having count(*) > 4
),
bd as (
  select * from (
    select bd.* , row_number() over (partition by bd.id_building order by bd.actual_area.dt_end desc) i
      from t_building_dossier bd
      where bd.actual_area.id_replace_user is null
  ) where i = 1
),
ass as (
  select * from (
    select t.id_deal, t.actual_area.dt_end dt_end , row_number() over (partition by t.id_deal order by t.actual_area.dt_end desc) i
      from t_assign t
      where t.actual_area.id_replace_user is null
  ) where i = 1
)
select
     d.num_deal "Номер дела"
    ,t.moniker  "Территория"
    ,bd.address "Адрес дома"
    ,(select name from t_enum_member em where key_enum = 'PAY_STANDART_KIND' and em.code = bd.e_pay_standart) "Стандарт"
    ,ass.dt_end "Конец назн."
  from tn, t_ls ls, bd, t_deal d, t_territory t, ass
  where tn.id_ls = ls.id_ls
    and ls.id_building = bd.id_building
    and tn.id_ls = d.id_ls
    and bd.id_territory = t.id_territory
    and d.id_deal = ass.id_deal
    -- numbers of tenant
    and tn.cnt > 4
--    and exists (
--      select 1 from t_assign ass
--        where ass.id_deal = d.id_deal
--          and ass.actual_area.is_Actual()='Y'
--    )
  order by ass.dt_end desc