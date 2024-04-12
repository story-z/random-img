@echo off
setlocal enabledelayedexpansion

set "outputFile=output.txt"

REM 清空输出文件
type nul > %outputFile%

REM 递归获取所有子文件夹下的.jpg图片
for /r %%i in (*.jpg) do (
    echo %%~fi>>%outputFile%
)

echo "扫描完成，结果保存在 %outputFile% 文件中"
