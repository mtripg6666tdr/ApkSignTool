@echo off

echo Signifying "%1"
jarsigner.exe -sigalg SHA1withRSA -digestalg SHA1 -keystore %2 %1 %3
echo Done.