<%
Dim sentencia, rs, BD, nombre, login, password, contador, cadena

nombre = Request("nombre")
login = Request("login")
password = Request("password")

contador=0
cadena=null

if (login="admin" and password="admin") then
set BD = Server.CreateObject("ADODB.Connection")
BD.Open "DSN=agendaper"
sentencia = "SELECT nombre FROM usuarios WHERE nombre='"+nombre+"'"
set rs= BD.Execute(sentencia)
Do While not rs.EOF
	contador=contador+1
	rs.MoveNext
Loop
rs.close()
	if (contador<>0)then
	sentencia = "DELETE FROM usuarios WHERE nombre='"+nombre+"'"
    set rs= BD.Execute(sentencia)
	cadena="Los datos se han eliminado satisfactoriamente."
	else
	cadena="Los datos que usted quiere eliminar no existen en la base de datos."
	end if
else
cadena="Usted no tiene autorización para eliminar registros de la base de datos."
end if
%>

<html>
<head>
<title>Agenda</title>
</head>
<body>
<center><h1><font face='arial'>Agenda Personal: BAJAS</font></h1><hr><br><p>
<font face='arial'><b><%=cadena%><b></font></center><br><p>
<br><p><div align='right'><h6><a href='http://150.214.127.78/asp/baja.html'><font face='arial'>Volver al Formulario de Bajas</font></a></h6></div>
</body>
</html>

 