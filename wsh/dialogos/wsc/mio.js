// Begin Callout E
function OK_Clicked()
{
  Finished = true;
}
// End Callout E

function ie_document_button_onclick()
{
	Finished = true;
}

//Const READYSTATE_COMPLETE = 4
//var ie = new ActiveXObject ("InternetExplorer.Application");
var ie = WScript.CreateObject("InternetExplorer.Application","ie_");

// Begin Callout A
ie.navigate("about:blank");
while (ie.ReadyState != 4)
  WScript.Sleep (50);
// End Callout A

// Begin Callout B
var text;
text = ie.document.createElement("textarea");
text.Value = "type text here";
ie.document.body.appendChild(text);
var okButton;
okButton = ie.document.createElement("input");
okButton.type = "button";
okButton.value = "OK";
ie.document.body.appendChild(okButton);
// End Callout B

// Begin Callout C
var Finished = false;
//okButton.onClick = GetRef("OK_Clicked");
//okButton.onClick = OK_Clicked();
okButton.onClick = "OK_Clicked();";
// End Callout C

ie.visible = true;

// Begin Callout D
while (!Finished)
	WScript.Sleep(50);
// End Callout D

WScript.Echo (text.value);
ie.Quit;
