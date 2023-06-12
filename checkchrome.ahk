#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
url := "https://chromedriver.chromium.org/downloads"
httpClient := ComObjCreate("WinHttp.WinHttpRequest.5.1")
httpClient.Open("GET", url, false)  ; false=not async
httpClient.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Trident/7.0; rv:11.0) like Gecko AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27")
httpClient.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
httpClient.Send()
httpClient.WaitForResponse()
Result := httpClient.ResponseText
html := ComObjCreate("HTMLFile")
html.write(Result)
elements := html.getElementsByTagName("a")


loop
{
 if (A_INDEX = 69)
 {
  ele := elements[A_INDEX].innerText
  vern := SubStr(ele, -12)
  if !FileExist(A_Temp "\chromedriver.txt")
  {
   RunWait, %ComSpec% /c curl https://chromedriver.storage.googleapis.com/%vern%/chromedriver_win32.zip -o %A_Temp%\chromedriver.zip,,Hide
   RunWait, %ComSpec% /c tar -xf %A_Temp%\chromedriver.zip,,Hide
   FileMove, chromedriver.exe, C:\Users\%A_UserName%\AppData\Local\SeleniumBasic\chromedriver.exe, 1
   FileDelete, LICENSE.chromedriver
   FileAppend, %ele%`n, %A_Temp%\chromedriver.txt
  }
  else
  {
   FileRead, Read, %A_Temp%\chromedriver.txt
   ;Msgbox % SubStr(Read, 1)
    if (Read = ele)
      return
    else
    {
      RunWait, %ComSpec% /c curl https://chromedriver.storage.googleapis.com/%vern%/chromedriver_win32.zip -o %A_Temp%\chromedriver.zip,,Hide
      RunWait, %ComSpec% /c tar -xf %A_Temp%\chromedriver.zip,,Hide
      FileDelete, %A_Temp%\chromedriver.txt
      Sleep, 10
      FileMove, chromedriver.exe, C:\Users\%A_UserName%\AppData\Local\SeleniumBasic\chromedriver.exe, 1
      FileDelete, LICENSE.chromedriver
      FileAppend, %ele%`n, %A_Temp%\chromedriver.txt
     }
  }
 }
 if (A_INDEX > 69)
   ExitApp
}


esc::ExitApp