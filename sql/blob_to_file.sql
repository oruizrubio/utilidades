set serveroutput on
declare
    w_blob blob;

  function get_blob_resguardo_sol (p_cdi_solicitud number) return blob
  is

    w_cdempresa         prs_procesos_evaluadores.cdempresa%type;
    w_idregistro        prs_solicitudes.idregistro%type;
    w_cdi_documento_gfi web_documentos_firmas.cdi_documento_gfi%type;
    w_ret               number;
    w_blob              blob;
    w_mensaje_error     varchar2(2000);

  begin

    select pr.cdempresa,
           sl.idregistro
      into w_cdempresa,
           w_idregistro
      from prs_solicitudes sl,
           prs_procesos_evaluadores pr
     where sl.cdi_solicitud = p_cdi_solicitud
       and pr.cdi_proceso   = sl.cdi_proceso;

    select max(cdi_documento_gfi)
      into w_cdi_documento_gfi
      from web_documentos_firmas
     where prs_cdi_solicitud = p_cdi_solicitud;

    w_ret := prs_i_sel_res.get_resguardo_solicitud (p_cdi_solicitud, w_cdi_documento_gfi, w_cdempresa, w_idregistro, w_blob, w_mensaje_error);
    
dbms_output.put_line('salida: '||w_ret);
dbms_output.put_line('error: '||w_mensaje_error);
dbms_output.put_line('blob: '||UTL_RAW.CAST_TO_VARCHAR2( w_blob ));

    -- Si se devuelve mensaje de error se propaga excepción
    if w_ret != 0
    then

        raise_application_error (-20403, 'Err[' || to_char(w_ret) || '] - Msg[' || w_mensaje_error || ']');

    end if;

    return w_blob;

  end get_blob_resguardo_sol;
  

PROCEDURE extract_file(p_blob blob) 
IS

    vblob BLOB;
    vstart NUMBER := 1;
    bytelen NUMBER := 32000;
    len NUMBER;
    my_vr RAW(32000);
    x NUMBER;

    l_output utl_file.file_type;

BEGIN
    -- define output directory
    l_output := utl_file.fopen('OBJ_GENERICO_3003', 'f_blob.pdf','wb', 32760);

    vstart := 1;
    bytelen := 32000;

    len := dbms_lob.getlength(p_blob);

    -- save blob length
    x := len;

    vblob := p_blob;

    -- if small enough for a single write
    IF len < 32760 
    THEN
        utl_file.put_raw(l_output,vblob);
        utl_file.fflush(l_output);
    ELSE -- write in pieces
        vstart := 1;
        WHILE vstart < len and bytelen > 0
        LOOP
           dbms_lob.read(vblob,bytelen,vstart,my_vr);

           utl_file.put_raw(l_output,my_vr);
           utl_file.fflush(l_output); 

           -- set the start position for the next cut
           vstart := vstart + bytelen;

           -- set the end position if less than 32000 bytes
           x := x - bytelen;
           IF x < 32000 
           THEN
              bytelen := x;
           END IF;
        end loop;   
    --END IF;
        utl_file.fclose(l_output);
    --end loop;
    end if;  
end extract_file;   

begin
    
    w_blob := get_blob_resguardo_sol(3057467);
    
    extract_file(w_blob);

end;
/