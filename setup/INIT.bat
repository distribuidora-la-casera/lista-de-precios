@echo off
echo ===========================
echo  CONFIGURANDO EL SISTEMA...
echo ===========================

cd /d "%~dp0.."

if not exist ".git" (
    git init
)

:: Config usuario
git config user.name "La Casera"
git config user.email "distribuidoralacasera@gmail.com"

git branch -M main

:: Agregar remoto con HTTPS (para PAT)
git remote remove origin >nul 2>&1
git remote add origin https://github.com/distribuidora-la-casera/lista-de-precios.git

:: Guardar credenciales con Credential Manager
git config --global credential.helper manager

:: Instalar openpyxl para Python
python -m pip install openpyxl

echo ===========================
echo  SETUP COMPLETADO
echo  Proximo paso:
echo  1) Generar PAT en GitHub
echo  2) La primera vez que ejecutes CLICK.bat, usar:
echo     - Username: distribuidora-la-casera
echo     - Password: token PAT generado
echo ===========================
pause
