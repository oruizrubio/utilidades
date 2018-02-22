set countfmb=0
for %%x in (fmb) do set /a countfmb+=1 

echo hola %countfmb%

set countfmx=0
for %%j in (fmx) do set /a countfmx+=1

if countfmb == countfmx (
	echo no error
)

echo error %countfmb% %countfmx%

dir /b *.fmb | find /c /i ".fmb"

dir /b *.fmx | find /c /i ".fmx"

set cfmx=dir /b *.fmx | find /c /i ".fmx"

echo valor %cfmx%

:end