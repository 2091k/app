@echo off
color a
:: ����Ƿ��Թ���Ա�������
fltmc >nul 2>&1 || (
    echo ���Թ���Ա������д˽ű�...
    pause >nul
    exit /b 1
)

:: ����NetFX3���ܣ�ʹ�õ�ǰĿ¼��ΪԴ
echo ��������NetFX3����...
dism /Online /Enable-Feature /FeatureName:NetFX3 /all

:: ��ʾ�������
if %errorlevel% equ 0 (
    echo NetFX3�������óɹ���
) else (
    echo NetFX3��������ʧ�ܣ��������: %errorlevel%
)

pause
    