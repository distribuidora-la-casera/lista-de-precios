@echo off
echo ===========================
echo  SUBIENDO LISTA DE PRECIOS
echo ===========================

cd /d "%~dp0"

:: Copiar datos procesados si hace falta (ejecutar el Python)
python src\xlsx_to_json.py

:: Añadir cambios
git add .

:: Commit automático con fecha/hora
set FECHA=%date% %time%
git commit -m "Actualizacion lista de precios %FECHA%"

:: Subir a GitHub Pages
git push -u origin main

echo ===========================
echo   LISTA SUBIDA CON EXITO
echo ===========================
pause
