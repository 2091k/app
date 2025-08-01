@echo off
color a
:: 检查是否以管理员身份运行
fltmc >nul 2>&1 || (
    echo 请以管理员身份运行此脚本...
    pause >nul
    exit /b 1
)

:: 启用NetFX3功能，使用当前目录作为源
echo 正在启用NetFX3功能...
dism /Online /Enable-Feature /FeatureName:NetFX3 /all

:: 显示操作结果
if %errorlevel% equ 0 (
    echo NetFX3功能启用成功！
) else (
    echo NetFX3功能启用失败，错误代码: %errorlevel%
)

pause
    