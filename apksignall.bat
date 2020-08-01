@echo off
setlocal enabledelayedexpansion
echo Starting Sign Process..
set PowerShell=%SystemRoot%\System32\WindowsPowerShell\v1.0\PowerShell.exe
set ZipAlign=%ANDROID_SDK_ROOT%\build-tools\29.0.2\zipalign.exe
set FileList=
for /f "usebackq" %%p in (`%PowerShell% -Command ^
 $P^=Read-Host -assecurestring """"Certificate file's Password""""^;^
 [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR^( ^
 [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR^($P^)^
 ^)`) do set PassWord=%%p
for %%f in (*.apk) do (
  zip -d %%f "META-INF/*"
  echo %PassWord%| apksigndefault %%f %1 %2
  %ZipAlign% -f -v 4 %%f %%f.led
  set FileList=%%f !FileList!
  del %%f
  ren %%f.led %%f
)
echo %FileList%
set PassWord=""
echo Done.