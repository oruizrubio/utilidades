var WShell = WScript.CreateObject("WScript.Shell");
var fs = WScript.CreateObject("Scripting.FileSystemObject");
var page_Avoid = new ActiveXObject("Scripting.Dictionary");
var regist_url = "http://www.infoseek.co.jp/Help?pg=help_addurl.html&lk=noframes&sf=1";

var source = WShell.RegRead("HKCU\\Software\\aya\\infoseek\\source");
var target = WShell.RegRead("HKCU\\Software\\aya\\infoseek\\target");
var predate = new Date(WShell.RegRead("HKCU\\Software\\aya\\infoseek\\date"));
var nAvoid = WShell.RegRead("HKCU\\Software\\aya\\infoseek\\navoid");
for(var i = 0; i < nAvoid; i++)
    page_Avoid.Add(WShell.RegRead("HKCU\\Software\\aya\\infoseek\\p" + i), 1)


var arrURL = new Array();
GetURL(fs.GetFolder(source));

var iURL = 0;
var nIE = 3;
var IE = new Array(nIE);
for(i = 0; i < nIE; i++)
    IE[i] = new Browser();

while(!IsAllFinished()) {
    for(i = 0; i < nIE; i++) {
        if(IE[i].load())
            IE[i].next();
    }
}

//WShell.RegWrite("HKCU\\Software\\aya\\infoseek\\date",
//        (new Date()).toString());

function IsAllFinished() {
    for(var i = 0; i < nIE; i++) {
        if(!IE[i].finished)
            return false;
    }
    return true;
}

function Browser() {
    this.IE = WScript.CreateObject("InternetExplorer.Application");
    this.next = nextStep;
    this.load = WaitLoad;
    this.IE.Width = 680; this.IE.Height = 660; this.IE.Top = 15;
    this.IE.Visible = true;
    this.finished = false;
    this.URL;
    this.status = 0;
    this.next();
}

function nextStep() {
    if(this.finished)
        return;
    switch(this.status) {
    case 0:
        if(iURL >= arrURL.length) {
            this.finished = true;
            this.IE.Quit();
        }
        else {
            this.URL = arrURL[iURL++];
            this.IE.Navigate(regist_url);
            this.status = 1;
        }
        break;
    case 1:
        with(this.IE.Document.forms[1]) {
            url.value = this.URL;
            submit.click();
        }
        this.status = 2;
        break;
    case 2:
        if(this.IE.Document.forms[0])
            this.IE.Document.forms[0].submit();
        this.status = 0;
        break;
    default:
        break;
    }
}

