FUNCTION upsert_pay_standart
        ( a_pay_standart      t_pay_standart.id_pay_standart%TYPE  := 0
        , a_name        t_pay_standart.e_pay_standart%TYPE
        , a_kind        t_pay_standart.e_pay_standart_kind%TYPE
        , a_value       t_pay_standart.value%TYPE
        , a_territory   t_territory.id_territory%TYPE
        , a_dt_beg      DATE
        , a_dt_end      DATE  := NULL
        ) RETURN t_pay_standart.id_pay_standart%TYPE
    AS
        l_id_pay_standart      t_pay_standart.id_pay_standart%TYPE := a_pay_standart;
        l_aa            ot_actual_area;
        -----------------------------------------------------------
        l_old_dt_beg    DATE;
        l_old_dt_end    DATE;
        l_new_dt_beg    DATE;
        l_new_dt_end    DATE;
        l_kind          VARCHAR2(2);
    BEGIN
IF pk_dbg.g_is_debug_on THEN
    pk_dbg.output( 'OWNER.pk_edit_pay_standart.upsert_pay_standart', 'a_pay_standart     ="$1$",a_name       ="$2$",a_kind       ="$3$",a_value      ="$4$",a_territory  ="$5$",a_dt_beg     ="$6$",a_dt_end     ="$7$"', a_pay_standart     ,a_name       ,a_kind       ,a_value      ,a_territory  ,a_dt_beg     , a_dt_end     ,
        a_src_file=>'D:\projects\erkc/KTSR\PR_KTSR\KTSR_OWNER\pk_edit_pay_standart.sp4',
        a_src_line=>'9');
END IF;
        l_aa := ot_actual_area.get_draft_aa;        -- статус-черновик
--##            SELECT * INTO lt FROM t_pay_standart WHERE id_pay_standart = a_pay_standart;
            --  вытащить область актуальности - старую
--##            _get_actual_period(t.,t_pay_standart t,t.id_pay_standart=lt.id_pay_standart AND t.id_deal=lt.id_deal,{l_old_dt_beg},{l_old_dt_end});            --
--##            pk_actual_area.reg_end('pay_standart', a_pay_standart, SYSDATE);
            l_id_pay_standart := pk_id.get('t_pay_standart');
            INSERT INTO t_pay_standart
                        (id_pay_standart, e_pay_standart, id_territory, e_pay_standart_kind, value, actual_area)
                 VALUES
                        (l_id_pay_standart,  a_name, a_territory, a_kind, a_value, l_aa);
            pk_actual_area.reg_beg ( 'pay_standart', l_id_pay_standart, FALSE, a_dt_beg, a_dt_end, NULL);
            --Двигаем даты переасчета
            IF a_pay_standart != 0 THEN
                SELECT SUBSTR(a_kind,0,1) INTO l_kind FROM dual;
                FOR i IN (SELECT DISTINCT id_building FROM t_building_dossier bd
                                WHERE e_pay_standart = l_kind
                                    AND
    (bd.actual_area.dt_beg<pk_actual_area.finish_date AND
    bd.actual_area.dtz_reg_beg<=pk_actual_area.physical_now AND
    bd.actual_area.dtz_replace>pk_actual_area.physical_now AND
    (bd.actual_area.dt_beg<>bd.actual_area.dt_end OR bd.actual_area.dtz_reg_end>pk_actual_area.physical_now) AND
    (bd.actual_area.dt_end>pk_actual_area.start_date OR bd.actual_area.dtz_reg_end>pk_actual_area.physical_now))
)
                LOOP
                    UPDATE t_deal SET dt_recalc_deal = GREATEST(dt_init,LEAST(dt_recalc_deal,TRUNC(a_dt_beg,'MM'))),
                                      dt_recalc_assign = GREATEST(dt_init,LEAST(dt_recalc_assign,TRUNC(a_dt_beg,'MM')))
                        WHERE id_ls IN (SELECT id_ls FROM t_ls WHERE id_building = i.id_building);
                END LOOP;
            END IF;
            --  вытащить область актуальности - новую
--##            _get_actual_period(t.,t_pay_standart t,t.id_pay_standart=lt.id_pay_standart AND t.id_deal = lt.id_deal,{l_new_dt_beg},{l_new_dt_beg});
            -- проверить ограничения по зоне актуальности ------------------------------------------
--##            check_actual_area(l_id_pay_standart, lt.id_pay_standart,l_old_dt_beg, l_old_dt_end, l_new_dt_beg, l_new_dt_end);
        RETURN l_id_pay_standart;
    END upsert_pay_standart;