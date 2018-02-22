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

if (login="admin" and password="admin") then
	set BD = Server.CreateObject("ADODB.Connection")
	BD.Open "DSN=agendaper"
	sentencia = "UPDATE usuarios SET domicilio='"+domicilio+"',localidad='"+localidad+"',provincia='"+provincia+"',cpostal='"+cpostal+"',telfijo='"+telfijo+"',telmovil='"+telmovil+"',tellab='"+tellab+"',fax='"+fax+"',email='"+email+"',observaciones='"+observaciones+"' WHERE nombre='"+nombre+"'"
	set rs= BD.Execute(sentencia)
    cadena="Los datos se han modificado satisfactoriamente."
else
cadena="Usted no tiene autorización para modificar registros de la base de datos."
end if

%>

<html>
<head>
<title>Agenda</title>
</head>
<body>
<center><h1><font face='arial'>Agenda Personal: MODIFICACIÓN</font></h1><hr><br><p>
<font face='arial'><b><%=cadena%><b></font></center><br><p>
<br><p><div align='right'><h6><a href='http://150.214.127.78/bd/modifica.html'><font face='arial'>Volver al Formulario de Modificación</font></a></h6></div>
</body>
</html>