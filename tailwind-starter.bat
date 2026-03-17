@echo off
title Tailwind CLI Setup

REM === Project name ===
set PROJECT_NAME=tailwind-cli-app

REM === Create folders ===
mkdir %PROJECT_NAME%
cd %PROJECT_NAME%
mkdir src

REM === Create files ===
type nul > src\input.css
type nul > src\output.css
type nul > src\index.html

REM === Install Tailwind CLI ===
echo Installing Tailwind CLI...
call npm init -y	
call npm install tailwindcss @tailwindcss/cli

REM === Add content to input.css ===
(
echo @import "tailwindcss";
) > src\input.css

REM === Add content to index.html ===
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
echo ^</html^>
) > src\index.html

REM === Run Tailwind CLI ===
echo Starting Tailwind build...
call npx @tailwindcss/cli -i ./src/input.css -o ./src/output.css --watch

cd %PROJECT_NAME%
cd src
start index.html
pause
