@echo off
set DB_USER=root
set DB_PASS=
set DB_HOST=127.0.0.1

:: Defina o caminho correto para o arquivo SQL (relativo à pasta do script)
set SQL_FILE=%~dp0..\..\src\db\safeworklite-dump.sql
set SEED_FILE=%~dp0..\..\src\db\seeder.sql

:: Defina o caminho completo para o executável mysql
set MYSQL_PATH=C:\xampp\mysql\bin\mysql.exe

:: Cria o banco de dados, se não existir
"%MYSQL_PATH%" -u %DB_USER% -p%DB_PASS% -h %DB_HOST% -e "CREATE DATABASE IF NOT EXISTS safeworklite;"

:: Executa o arquivo SQL no banco de dados safeworklite
"%MYSQL_PATH%" -u %DB_USER% -p%DB_PASS% -h %DB_HOST% safeworklite < "%SQL_FILE%"

:: Verifica se o arquivo seeder.sql existe e insere os dados
if exist "%SEED_FILE%" (
    "%MYSQL_PATH%" -u %DB_USER% -p%DB_PASS% -h %DB_HOST% safeworklite < "%SEED_FILE%"
    echo Dados inseridos com sucesso a partir de seeder.sql.
) else (
    echo Arquivo seeder.sql nao encontrado.
)

echo Banco de dados, tabelas e dados criados/inseridos com sucesso.
pause
