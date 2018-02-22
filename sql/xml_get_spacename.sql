declare
    function get_xml_namespace (p_cdi_remcot_envio number) return varchar2
    as
        v_clob    CLOB;
        v_varchar VARCHAR2(32767);
        v_start   PLS_INTEGER := 1;
        v_buffer  PLS_INTEGER := 32767;
        blob_in   blob;
        x         xmltype;
        w_obj       number;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_clob, TRUE);
         
         select obj_cdi_objeto into w_obj from prs_rem_cot_envios where cdi_remcot_envio = p_cdi_remcot_envio;

         --select col into blob_in from blob_xml where id = 1;
         select fichero into blob_in from objetos where cdi_objeto = w_obj;
         
         FOR i IN 1 .. CEIL(DBMS_LOB.GETLENGTH(blob_in) / v_buffer) LOOP
         
           v_varchar := UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(blob_in,
                                                                 v_buffer,
                                                                 v_start));
         
           DBMS_LOB.WRITEAPPEND(v_clob, LENGTH(v_varchar), v_varchar);
         
           v_start := v_start + v_buffer;
         END LOOP;
         
         x := xmltype.createxml(v_clob);
         --dbms_output.put_line(x.getclobval());

         return  x.getNamespace;
    end get_xml_namespace; 

begin
    DBMS_OUTPUT.put_line( 'NameSpace = ' || get_xml_namespace(5238853));
end;
/