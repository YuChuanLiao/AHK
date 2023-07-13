UrlDownloadToFile, https://github.com/florentbr/SeleniumBasic/releases/download/v2.0.9.0/SeleniumBasic-2.0.9.0.exe, SeleniumBasic-2.0.9.0.exe
UrlDownloadToFile, http://download.microsoft.com/download/2/0/e/20e90413-712f-438c-988e-fdaa79a8ac3d/dotnetfx35.exe, dotnetfx35.exe

run, C:\Users\%Username%\Downloads\SeleniumBasic-2.0.9.0.exe
Sleep 2000
;WinWaitActive, Setup - Selenium Basic
if WinExist("Setup - Selenium Basic")
{
;Sleep 2000
Send {Enter}
Sleep 1000
Send {Tab}{Up}{Enter}
Sleep 1000
Send {Enter}
Sleep 1000
Send {Enter}
Sleep 8000
Send {Enter}
}
else{
Msgbox Error!
}