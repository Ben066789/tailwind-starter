@echo off
title Tailwind CLI Auto Setup

REM === ask for project name ===
set /p PROJECT_NAME=Enter project folder name: 
if "%PROJECT_NAME%"=="" set PROJECT_NAME=tailwind-cli-app

REM === create project ===
mkdir %PROJECT_NAME%
cd %PROJECT_NAME%
mkdir src

REM === init + install ===
echo Installing dependencies...
call npm init -y
call npm install tailwindcss @tailwindcss/cli

REM === create files ===
(
echo @import "tailwindcss";
) > src\input.css

type nul > src\output.css

(
echo ^<!doctype html^>
echo ^<html^>
echo ^<head^>
echo   ^<meta charset="UTF-8"^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo   ^<link href="./output.css" rel="stylesheet"^>
echo ^</head^>
echo ^<body^>
echo   ^<h1 class="text-3xl font-bold underline"^>
echo     Hello world!
echo   ^</h1^>
echo ^</body^>
echo ^</html^>) > src\index.html

REM === run tailwind ===
echo Starting Tailwind...
start cmd /k npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch

REM === open project ===
cd src
start index.html

echo.
echo done.
pause
