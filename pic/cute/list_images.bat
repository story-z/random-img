@echo off
setlocal enabledelayedexpansion

set "outputFile=output.csv"

REM 获取当前文件夹名称
for %%I in (.) do set "folderName=%%~nxI"

set "outputFile=!folderName!.csv"

REM 清空输出文件
type nul > %outputFile%

REM 获取当前文件夹下所有图片文件的文件名和后缀，并拼接文件夹名称
for %%i in (*.jpg *.jpeg *.png *.gif *.bmp) do (
    echo https://gitcode.net/hao/random-img/-/raw/master/pic/!folderName!/%%~nxi>>%outputFile%
)

echo "扫描完成，结果保存在 %outputFile% 文件中"
