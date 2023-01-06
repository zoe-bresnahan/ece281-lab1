@echo off

echo Building Vivado projeect from TCL file
echo ----------------------------------------

set VivadoPath="C:\Xilinx\Vivado\2018.2\bin\vivado.bat"
:: chcek if vivado path is valid
if not exist %VivadoPath% (
    echo Vivado path is not valid
    exit /b 1
)

set TCL="build.tcl"
:: check if TCL file is valid
if not exist %TCL% (
    echo TCL file is not valid
    exit /b 1
)

:: run vivado in batch mode to build project
%VivadoPath% -mode batch -source %TCL%

:: check if vivado exited with error
if errorlevel 1 (
    echo Vivado exited with error
    exit /b 1
)

echo ----------------------------------------

:: find the name of the .xpr file
for /f %%i in ('dir /b *.xpr') do set xpr=%%i & goto DONE

:DONE

echo Project built. Can be opened by double-clicking %xpr%
echo (hint) run "explorer.exe ." to see files.
