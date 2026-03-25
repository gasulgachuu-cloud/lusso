@echo off
REM ═══════════════════════════════════════════════════════════════
REM  LUSSO CHICKEN - AUTOMATIC DEPLOYMENT SCRIPT
REM  Just run this file and your website goes live!
REM ═══════════════════════════════════════════════════════════════

echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║   LUSSO CHICKEN - DEPLOYING TO GITHUB PAGES              ║
echo ╚═══════════════════════════════════════════════════════════╝
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git is not installed!
    echo Please download from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git found!
echo.

REM Configure Git
echo Configuring Git with your details...
git config --global user.name "lusso-chicken"
git config --global user.email "gasulgachuu@gmail.com"

echo ✅ Git configured!
echo.

REM Initialize repository if needed
if not exist ".git" (
    echo Initializing Git repository...
    git init
    echo ✅ Repository initialized!
)

echo.
echo Adding all files...
git add .

echo ✅ Files added!
echo.

echo Committing changes...
git commit -m "Lusso Chicken Website - Deployed on %date%"

echo ✅ Committed!
echo.

REM Set remote origin if not exists
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Setting up remote repository...
    git remote add origin https://github.com/lusso-chicken/lusso-chicken.github.io.git
    echo ✅ Remote set!
) else (
    echo ✅ Remote already configured!
)

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║  ✅ DEPLOYMENT COMPLETE!                                 ║
echo ║                                                           ║
echo ║  Your website is LIVE at:                                ║
echo ║  https://lusso-chicken.github.io                         ║
echo ║                                                           ║
echo ║  Wait 2-5 minutes, then visit the link!                 ║
echo ╚═══════════════════════════════════════════════════════════╝
echo.

pause
