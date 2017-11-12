    function fnShellFindFilesJ()
    {
        var objShell = new ActiveXObject("shell.application");
        
        objShell.FindFiles();
    }
	
	fnShellFindFilesJ();