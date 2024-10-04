#!/bin/bash

# Defina os parâmetros de conexão do MySQL/MariaDB
DB_USER="root"
DB_PASS=""
DB_HOST="127.0.0.1"

# Defina o caminho correto para o arquivo SQL (relativo à pasta do script)
SQL_FILE="$(dirname "$0")/../../src/db/safeworklite-dump.sql"

# Defina o caminho completo para o executável mysql (assumindo que esteja no PATH)
MYSQL_PATH="/usr/bin/mysql"  # Ou outro caminho onde o MySQL esteja instalado, ajuste conforme necessário

# Execute o arquivo SQL usando a variável SQL_FILE e o comando mysql
"$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" < "$SQL_FILE"

echo "Banco de dados e tabelas criados com sucesso."
