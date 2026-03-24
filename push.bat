@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: Chạy từ thư mục gốc repo (thư mục cha của github-manager)
cd /d "%~dp0\.."
if not exist ".git" (
    echo LOI: Khong tim thay .git o thu muc: %CD%
    echo Hay chay script trong repo da khoi tao git.
    pause
    exit /b 1
)

echo --------------------------------------------------
echo Repo: %CD%
echo --------------------------------------------------
echo.

git add .
if %ERRORLEVEL% NEQ 0 (
    echo LOI: git add that bai.
    pause
    exit /b 1
)

set /p COMMITMSG="Nhap commit message: "
if not defined COMMITMSG (
    echo Huy: commit message trong.
    pause
    exit /b 1
)

git commit -m "!COMMITMSG!"
if %ERRORLEVEL% NEQ 0 (
    echo LOI: git commit that bai ^(co the khong co thay doi de commit^).
    pause
    exit /b 1
)

echo.
git push origin main
if %ERRORLEVEL% NEQ 0 (
    echo LOI: git push that bai.
    pause
    exit /b 1
)

echo.
echo OK: Da push len origin main.
pause
endlocal
