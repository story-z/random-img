@echo off
setlocal enabledelayedexpansion

set "outputFile=all.csv"
REM 需要排除的文件夹
set "excludeDirs=cat capoo kagura chaijun cute"

REM 删除之前的合并文件
if exist %outputFile% del %outputFile%

REM 递归执行子文件夹的list_images.bat
for /r %%i in (.) do (
    if exist "%%i\list_images.bat" (
        call :shouldProcess "%%i"
        if !errorlevel! == 0 (
            pushd "%%i"
            call :runListImages
            popd
        )
    )
)

REM 合并子文件夹下的 .csv 文件到一个文件中
pushd %~dp0
for /r %%i in (*.csv) do (
    call :shouldProcess "%%~dpi"
    if !errorlevel! == 0 (
        if not "%%i"=="%outputFile%" (
            for %%F in ("%%i") do (
                echo Processing file: %%~nxF
                type "%%i" >> "!outputFile!"
            )
        )
    )
)
popd

exit /b

:runListImages
call list_images.bat
exit /b

:shouldProcess
set "dirToCheck=%~1"
set "exclude=0"
for %%d in (%excludeDirs%) do (
    if not "!dirToCheck:%%d=!" == "!dirToCheck!" (
        set "exclude=1"
    )
)
exit /b !exclude!
