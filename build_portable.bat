@echo off
REM ========================================
REM Portable Jira Exporter Builder
REM ========================================

echo Building portable Jira Exporter...
echo.

REM Clean previous builds
if exist "dist" rmdir /s /q dist
if exist "build" rmdir /s /q build
if exist "*.spec" del /q *.spec

REM Build single executable
pyinstaller --onefile --name "JiraExporter" --icon=NONE ^
    --add-data "config.json;." ^
    --hidden-import "openpyxl" ^
    --hidden-import "office365" ^
    --hidden-import "pandas" ^
    --hidden-import "requests" ^
    --noconsole=False ^
    jira_exporter_portable.py

echo.
echo Build complete!
echo.

REM Create distribution folder
if not exist "portable_release" mkdir portable_release
copy "dist\JiraExporter.exe" "portable_release\"
copy "config.json" "portable_release\"
copy "README_PORTABLE.txt" "portable_release\README.txt"
if exist "jira_export.xlsx" copy "jira_export.xlsx" "portable_release\"
if exist "jira_export_20251125.xlsx" copy "jira_export_20251125.xlsx" "portable_release\"

echo.
echo ==========================================
echo Portable package created in: portable_release\
echo.
echo Contents:
echo   - JiraExporter.exe  (the application)
echo   - config.json       (edit this to configure)
echo   - jira_export.xlsx  (template, if exists)
echo.
echo You can copy the entire portable_release folder
echo to any Windows machine (no admin required)
echo ==========================================
echo.
pause