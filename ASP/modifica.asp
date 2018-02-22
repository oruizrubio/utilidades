<%
Dim sentencia, rs, BD, nombre, domicilio, localidad, provincia, cpostal, telfijo, telmovil, tellab, fax, email, observaciones, login, password, contador

nombre = Request("nombre")
login = Request("login")
password = Request("password")

contador=0

if (login="admin" and password="admin") then
set BD = Server.CreateObject("ADODB.Connection")
BD.Open "DSN=agendaper"
sentencia = "SELECT * FROM usuarios WHERE nombre='"+nombre+"'"
set rs= BD.Execute(sentencia)
Do While not rs.EOF
	domicilio=rs("domicilio")
	localidad=rs("localidad")
	provincia=rs("provincia")
	cpostal=rs("cpostal")
	telfijo=rs("telfijo")
	telmovil=rs("telmovil")
	tellab=rs("tellab")
	fax=rs("fax")
	email=rs("email")
	observaciones=rs("observaciones")
	contador=contador+1
	rs.MoveNext
Loop
rs.close()	
	if (contador<>0) then%>
	<html>
	<head>
	<title>Agenda</title>
	<script language='JavaScript'>
	<!--
	function enviar()
	{
	Error="";
	if (formulario.nombre.value =="")
	Error += "Campo Nombre y Apellidos vacío.\n";
	if (formulario.domicilio.value =="")
	Error += "Campo Domicilio vacío.\n";
	if (formulario.localidad.value =="")
	Error += "Campo Localidad vacío.\n";
	if (formulario.provincia.value =="")
	Error += "Campo Provincia vacío.\n";
	if (formulario.cpostal.value =="")
	Error += "Campo Código Postal vacío.\n";
	if (formulario.telfijo.value =="")
	Error += "Campo Teléfono Particular vacío.\n";
	if (formulario.telmovil.value =="")
	Error += "Campo Teléfono Móvil vacío.\n";
	if (formulario.tellab.value =="")
	Error += "Campo Teléfono Laboral vacío.\n";
	if (formulario.fax.value =="")
	Error += "Campo Fax vacío.\n";
	if (formulario.email.value =="")
	Error += "Campo E-mail vacío.\n";
	if (formulario.observaciones.value =="")
	Error += "Campo Observaciones vacío.\n";
	if (formulario.login.value =="")
	Error += "Campo Login vacío.\n";
	if (formulario.password.value =="")
	Error += "Campo Password vacío.\n";
	if (!Error)
	{
	document.formulario.action="http://150.214.127.78/asp/modificaya.asp";
	document.formulario.submit();
	}
	else
	alert(Error);
	}
	-->
	</script>
	</head>
	<body>
	<center><h1><font face="arial">Agenda Personal: MODIFICACIÓN</font></h1><hr><br><p>
	<font face="arial"><b>Modifique los datos que desee:<b></font></center><br><p>
	<form name="formulario" action="javascript:enviar();" method=POST>
	<table align="center" border=0 width=350>
	<tr><td><b>Nombre y Apellidos:</b></td>
	<td><input type=text name=_nombre value="<%=nombre%>" disabled><input type=hidden name=nombre value="<%=nombre%>"></td></tr>
	<tr><td><b>Domicilio:</b></td>
	<td><input type=text name=domicilio value="<%=domicilio%>"></td></tr>
	<tr><td><b>Localidad:</b></td>
	<td><input type=text name=localidad value="<%=localidad%>"></td></tr>
	<tr><td><b>Provincia:</b></td>
	<td><input type=text name=provincia value="<%=provincia%>"></td></tr>
	<tr><td><b>Código Postal:</b></td>
	<td><input type=text name=cpostal value="<%=cpostal%>"></td></tr>
	<tr><td><b>Teléfono Particular:</b></td>
	<td><input type=text name=telfijo value="<%=telfijo%>"></td></tr>
	<tr><td><b>Teléfono Móvil:</b></td>
	<td><input type=text name=telmovil value="<%=telmovil%>"></td></tr>
	<tr><td><b>Teléfono Laboral:</b></td>
	<td><input type=text name=tellab value="<%=tellab%>"></td></tr>
	<tr><td><b>Fax:</b></td>
	<td><input type=text name=fax value="<%=fax%>"></td></tr>
	<tr><td><b>E-mail:</b></td>
	<td><input type=text name=email value="<%=email%>"></td></tr>
	<tr><td valign="top"><b>Observaciones:</b></td>
	<td><textarea name="observaciones" rows=6 cols=15><%=observaciones%></textarea></td></tr>
	<tr><td><br><p><font face="arial" color="0000ff"><b>Login:</b></font></td>
	<td><br><p><input type=text name=login></td></tr>
	<tr><td><font face="arial" color="0000ff"><b>Password:</b></font></td>
	<td><input type=password name=password></td></tr>
	<tr><td align="center"><br><input type=submit value="Enviar" id=submit1 name=submit1></td>
	<td align="center"><br><input type=reset value="Borrar" id=reset1 name=reset1></td></tr>
	</table>
	</form>
	<br><p><div align="right"><h6><a href="http://150.214.127.78/asp/modifica.html"><font face="arial">Volver al Formulario de Modificación</font></a></h6></div>
	</body>
	</html><%
	else%>
	<html>
	<head>
	<title>Agenda</title>
	</head>
	<body>
	<center><h1><font face='arial'>Agenda Personal: MODIFICACIÓN</font></h1><hr><br><p>
	<font face='arial'><b>Los datos del usuario que usted quiere modificar no existen en la base de datos.<b></font></center><br><p>
	<br><p><div align='right'><h6><a href='http://150.214.127.78/asp/modifica.html'><font face='arial'>Volver al Formulario de Modificación</font></a></h6></div>
	</body>
	</html><%
	end if
else%>
<html>
<head>
<title>Agenda</title>
</head>
<body>
<center><h1><font face='arial'>Agenda Personal: MODIFICACIÓN</font></h1><hr><br><p>
<font face='arial'><b>Usted no tiene autorización para modificar registros de la base de datos.<b></font></center><br><p>
<br><p><div align='right'><h6><a href='http://150.214.127.78/asp/modifica.html'><font face='arial'>Volver al Formulario de Modificación</font></a></h6></div>
</body>
</html><%
end if
%>