@echo off
title Update to Hosts
color 3f
echo 
echo ------------------------------------------------------------ 
echo.
echo   Powered by Micro Developer soft Inc.                     
echo.                                                           
echo   If you need hosts other devices, please goto:            
echo.                                                           
echo   https://https://github.com/by-JohnChen/GFW-Hosts           
echo ------------------------------------------------------------
echo.
echo Next, download hosts...
pause
goto download

:download
cls
echo Set xPost = CreateObject("Microsoft.XMLHTTP") >a.vbe  
echo xPost.Open "GET","https://raw.githubusercontent.com/by-JohnChen/GFW-Hosts/master/Windows/hosts",0 >>a.vbe  
echo xPost.Send() >>a.vbe  
echo Set sGet = CreateObject("ADODB.Stream") >>a.vbe  
echo sGet.Mode = 3 >>a.vbe  
echo sGet.Type = 1 >>a.vbe  
echo sGet.Open() >>a.vbe  
echo sGet.Write(xPost.responseBody) >>a.vbe  
echo sGet.SaveToFile "hosts",2 >>a.vbe 
a.vbe  
del a.vbe
echo Done.
if exist "%SystemRoot%\System32\drivers\etc\hosts" attrib -h -r -s -a "%SystemRoot%\System32\drivers\etc\hosts"
if not exist "%SystemRoot%\System32\drivers\etc\hosts" goto NEXT
if exist "%SystemRoot%\System32\drivers\etc\hosts.bak" del "%SystemRoot%\System32\drivers\etc\hosts.bak"
ren "%SystemRoot%\System32\drivers\etc\hosts" hosts.bak
:NEXT
copy "%~dp0hosts" "%SystemRoot%\System32\drivers\etc\hosts"
del hosts
ipconfig /flushdns