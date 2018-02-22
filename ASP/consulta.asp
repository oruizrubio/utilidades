<%
Dim sentencia, rs, BD, nombre, domicilio, localidad, provincia, cpostal, telfijo, telmovil, tellab, fax, email, observaciones, login, password, contador, cadena

nombre = Request("nombre")
provincia = Request("provincia")
busqueda = Request("busqueda")

contador=0
cadena=null

%>
<html>
<head>
<title>Agenda</title>
</head>
<body>
<center><h1><font face='arial'>Agenda Personal: CONSULTAS</font></h1><hr><br><p><table border=1 cellspacing=0 bordercolor='000000' align='center'>
<tr><td align='center' colspan=2><b>Nombre y Apellidos</b></td><td align='center'><b>Domicilio</b></td><td align='center'><b>Localidad</b></td><td align='center'><b>Provincia</b></td><td align='center'><b>Código Postal</b></td></tr>
<tr><td align='center'><b>Teléfono Particular</b></td><td align='center'><b>Teléfono Móvil</b></td><td align='center'><b>Teléfono Laboral</b></td><td align='center'><b>Fax</b></td><td align='center'><b>Correo Electrónico</b></td><td align='center'><b>Observaciones</b></td></tr>
<tr><td colspan=6>&nbsp;</td></tr>
<%

if (nombre="" and provincia="") then
	sentencia="SELECT * FROM usuarios"
elseif (nombre<>"" and provincia="") then
	if (busqueda="Exhaustiva") then
		sentencia="SELECT * FROM usuarios WHERE nombre='"+nombre+"'"	
	else
		sentencia="SELECT * FROM usuarios WHERE nombre like '"+nombre+"%'"	
	end if
elseif (nombre="" and provincia<>"") then
	if (busqueda="Exhaustiva") then
		sentencia="SELECT * FROM usuarios WHERE provincia='"+provincia+"'"
	else
		sentencia="SELECT * FROM usuarios WHERE provincia like '"+provincia+"%'"
	end if
else		
	if (busqueda="Exhaustiva") then
		sentencia="SELECT * FROM usuarios WHERE nombre='"+nombre+"' and provincia='"+provincia+"'"
	else
		sentencia="SELECT * FROM usuarios WHERE nombre like '"+nombre+"%' and provincia like '"+provincia+"%'"
	end if
end if

set BD = Server.CreateObject("ADODB.Connection")
BD.Open "DSN=agendaper"
set rs= BD.Execute(sentencia)
Do While not rs.EOF%>
<tr><td colspan=2><%=rs("nombre")%></td><td><%=rs("domicilio")%></td><td><%=rs("localidad")%></td><td><%=rs("provincia")%></td><td><%=rs("cpostal")%></td></tr>
<tr><td><%=rs("telfijo")%></td><td><%=rs("telmovil")%></td><td><%=rs("tellab")%></td><td><%=rs("fax")%></td><td><%=rs("email")%></td><td><%=rs("observaciones")%></td></tr>
<tr><td colspan=6>&nbsp;</td></tr><%
contador=contador+1
rs.MoveNext
Loop
rs.close()

if (contador=0) then %>
	<font face='arial'><b>No existe ningún dato que satisfaga las condiciones de búsqueda.<b></font></center><br><p>
<%end if%>
</table><br><p><div align='right'><h6><a href='http://150.214.127.78/asp/consulta.html'><font face='arial'>Volver al Formulario de Consultas</font></a></h6></div>
</body>
</html>

 