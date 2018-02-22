delete from web_emp_bor_tipos_meritos where cdi_solicitud in (select cdi_solicitud from web_emp_borradores  where nif = '30942855N');
delete from WEB_EMP_BOR_MERITOS where cdi_temp_empleo in (select cdi_temp_empleo from web_emp_bor_tipos_meritos where cdi_solicitud in (select cdi_solicitud from web_emp_borradores  where nif = '30942855N'));
delete from web_emp_borradores  where nif = '30942855N';
delete from web_documentos_firmas where prs_cdi_solicitud in (select cdi_solicitud from prs_solicitudes where nif = '30942855N');
delete from prs_meritos_solicitudes where cdi_solicitud in (select cdi_solicitud from prs_solicitudes where nif = '30942855N');
delete from prs_solicitudes where nif = '30942855N';