set serveroutput on 
declare
    p_t_param_sel epr_reports.t_parametros;
begin
    epr_reports.carga_parametro('oscar', 'ruiz',p_t_param_sel);     
    epr_reports.carga_parametro('lourdes', 'millan',p_t_param_sel);    
    epr_reports.carga_parametro('olga', 'lopera',p_t_param_sel);
    
    for i in 1..p_t_param_sel.count
    loop      
        dbms_output.put_line ('1 '||p_t_param_sel(i).nombre ||' ' || p_t_param_sel(i).valor);
    end loop;
    
    epr_reports.carga_parametro('lourdes', 'ruiz',p_t_param_sel);
    epr_reports.carga_parametro('pepe', 'moreno',p_t_param_sel);
    epr_reports.carga_parametro('oscar', 'martinez',p_t_param_sel);
    
    for i in 1..p_t_param_sel.count
    loop      
        dbms_output.put_line ('2 '||p_t_param_sel(i).nombre ||' ' || p_t_param_sel(i).valor);
    end loop;    
end;
/    