@echo off
set DB_USER=root
set DB_PASS=
set DB_HOST=127.0.0.1

:: Execute o arquivo SQL
mysql -u %DB_USER% -p%DB_PASS% -h %DB_HOST% < db\safeworklite-dump.sql

echo Banco de dados e tabelas criados com sucesso.
pause
