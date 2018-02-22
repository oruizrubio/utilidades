  // creamos un objeto de tipo instalación
  var ins = new ActiveXObject("penton.scripting.iedialogs");

  ins.Initialization;
  //ins.Register();

  var a = new ActiveXObject( "WScript.Shell" );

  WScript.Echo (WScript.ScriptFullName);
  WScript.Echo (ins.PassWord(a));
  // obtenemos el objeto tipo aplicación
/*
  var wApl = ins.getAplicacion(aplicacion);

  // dependiendo si es nulo modificamos la versión o creamos la aplicación
  if (wApl != null)
  {
    wApl.setVersion(ver_cli);
    ins.registrarAplicacion(wApl);
    ins.commit();
  }
  else
  {
    var apl = new ActiveXObject("EPRInstalaciones.Aplicacion");
    apl.Aplicacion(aplicacion,"Administración de aplicaciones y usuarios",ver_cli,"c:\\epr\\dev60\\apl\\adm");
    ins.registrarAplicacion(apl);
    ins.commit();
  }
*/