@echo off
rem setlocal enableextensions
set count=0
for %%x in (*.fmb) do set /a count+=1
echo %count%
endlocal
rem pause
set count2=0
for %%x in (*.fmx) do set /a count2+=1
echo %count2%
if %count% NEQ %count2% (
echo no iguales
goto :end
)

echo iguales

:end