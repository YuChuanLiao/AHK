;*******************************************************
; Want a clear path for learning AutoHotkey; Take a look at our AutoHotkey Udemy courses.  They're structured in a way to make learning AHK EASY
; Right now you can  get a coupon code here: https://the-Automator.com/Learn
;*******************************************************
F8::
Selection := ComObjActive("Outlook.Application").ActiveExplorer().Selection ;Connect to Outlook and store list of selected emails
For a,b in Selection { ;Loop over selected emails
	oAtt:=selection.item(A_Index).Attachments ;For each email, create object storing the attachments
	
	for k, v in oAtt  ;use For loop over attachments
       if (InStr(k.DisplayName, Y188324) > 0) or (Instr(k.DisplayName, Y280872) > 0) or (Instr(k.DisplayName, LP61044) > 0)
		k.SaveAsFile(A_MyDocuments "\bill\" . k.DisplayName)  ;This will write the files to the C:\temp\ folder.  Update for your needs.
}
return