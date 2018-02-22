<%
Dim sentencia, rs, BD, nombre, domicilio, localidad, provincia, cpostal, telfijo, telmovil, tellab, fax, email, observaciones, login, password, contador, cadena

nombre = Request("nombre")
domicilio = Request("domicilio")
localidad = Request("localidad")
provincia = Request("provincia") 
cpostal = Request("cpostal")
telfijo = Request("telfijo")
telmovil = Request("telmovil")
tellab = Request("tellab")
fax = Request("fax")
email = Request("email")
observaciones = Request("observaciones")
login = Request("login")
password = Request("password")

contador=0
cadena=null

if (login="admin" and password="admin")then
set BD = Server.CreateObject("ADODB.Connection")
BD.Open "DSN=agendaper"
sentencia = "SELECT nombre FROM usuarios WHERE nombre='"+nombre+"'"
set rs= BD.Execute(sentencia)
Do While not rs.EOF
	contador=contador+1
	rs.MoveNext
Loop
rs.close()
	if (contador=0) then
	sentencia = "INSERT INTO usuarios VALUES ('"+nombre+"','"+domicilio+"','"+localidad+"','"+provincia+"','"+cpostal+"','"+telfijo+"','"+telmovil+"','"+tellab+"','"+fax+"','"+email+"','"+observaciones+"')"
    set rs= BD.Execute(sentencia)
	cadena="Los datos se han introducido satisfactoriamente."
	else
	cadena="Los datos que usted quiere introducir ya existen en la base de datos."
	end if
else
cadena="Usted no tiene autorización para añadir registros a la base de datos."
end if
%>

<html>
<head>
<title>Agenda</title>
</head>
<body>
<center><h1><font face="arial">Agenda Personal: ALTAS</font></h1><hr><br><p>
<font face="arial"><b><%=cadena%><b></font></center><br><p>
<br><p><div align="right"><h6><a href="http://150.214.127.78/asp/alta.html"><font face="arial">Volver al Formulario de Altas</font></a></h6></div>
</body>
</html>


 
 