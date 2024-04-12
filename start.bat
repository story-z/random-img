@echo off
setlocal enabledelayedexpansion

set "outputFile=all.csv"

REM 删除之前的合并文件
if exist %outputFile% del %outputFile%

REM 递归执行子文件夹的list_images.bat
for /r %%i in (.) do (
    if exist "%%i\list_images.bat" (
        pushd "%%i"
        call :runListImages
        popd
    )
)

REM 合并子文件夹下的 .csv 文件到一个文件中
pushd %~dp0
for /r %%i in (*.csv) do (
    if not "%%i"=="%outputFile%" (
        for %%F in ("%%i") do (
            echo Processing file: %%~nxF
            type "%%i" >> "!outputFile!"
        )
    )
)

exit /b

:runListImages
call list_images.bat
exit /b
