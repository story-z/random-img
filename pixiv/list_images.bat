@echo off
setlocal enabledelayedexpansion

set "outputFile=output.csv"

REM 获取当前文件夹名称
for %%I in (.) do set "folderName=%%~nxI"

set "outputFile=!folderName!.csv"

REM 清空输出文件
type nul > %outputFile%

REM 获取当前文件夹下的.jpg图片的文件名和后缀，并拼接文件夹名称
for %%i in (*.jpg) do (
    echo https://gitcode.net/hao/random-img/-/raw/master/!folderName!/%%~nxi>>%outputFile%
)

echo "扫描完成，结果保存在 %outputFile% 文件中"
