declare 

    procedure sequence_newvalue(seqowner varchar2, seqname varchar2, newvalue number) 
    as
    
        ln number;
        ib number;
        
    begin
    
        select last_number, 
               increment_by
          into ln, 
               ib
          from dba_sequences
         where sequence_owner = upper(seqowner)
           and sequence_name = upper(seqname);
           
       execute immediate 'alter sequence ' || seqowner || '.' || seqname ||
               ' increment by ' || (newvalue - ln);
       execute immediate 'select ' || seqowner || '.' || seqname ||
               '.nextval from dual' into ln;
       execute immediate 'alter sequence ' || seqowner || '.' || seqname || 
               ' increment by ' || ib;
               
    end;
    
begin 

    sequence_newvalue( '&esquema', '&secuencia', &valor );

end;
/
