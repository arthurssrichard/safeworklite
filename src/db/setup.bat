@echo off
set DB_USER=root
set DB_PASS=
set DB_HOST=127.0.0.1

:: Defina o caminho correto para o arquivo SQL (relativo à pasta do script)
set SQL_FILE=%~dp0..\..\src\db\safeworklite-dump.sql

:: Defina o caminho completo para o executável mysql
set MYSQL_PATH=C:\xampp\mysql\bin\mysql.exe

:: Execute o arquivo SQL usando o caminho completo para o mysql e a variável SQL_FILE
"%MYSQL_PATH%" -u %DB_USER% -p%DB_PASS% -h %DB_HOST% < "%SQL_FILE%"

echo Banco de dados e tabelas criados com sucesso.
pause
