/**
 *    Name:           wshpopup.js
 *    Description:    Simple script to show a WSH Popup Message Box.
 *    Author:         Daren Thiel
 *    Date:           31 Oct 1998
 *    Web:            http://www.winscripter.com
 **/
/* Function to encapsulate a Popup */
/* referencia ws.popup: http://www.devguru.com/content/technologies/wsh/wshshell-popup.html */
function showit(Message, title)
{

  var timeout = 0;
  //var buttons = 65;  --> en la referencia podemos ver los distintos valores para mostrar botones y de retorno
  var buttons = 0;
  var rslt;
  var WS = WScript.CreateObject("WScript.Shell");
  rslt = WS.Popup(Message, timeout, title, buttons);
  if ( rslt == 2 ) {
    WScript.Quit;
  } 
}

/* Call the function */
showit("This is my first popup", "This is the title");