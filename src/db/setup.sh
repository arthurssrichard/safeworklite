#!/bin/bash

# Defina os parâmetros de conexão do MySQL/MariaDB
DB_USER="root"
DB_PASS=""
DB_HOST="127.0.0.1"
DB_PORT="3306"  # Porta correta
DB_NAME="safeworklite"  # Nome do banco de dados

# Defina o caminho correto para o arquivo SQL (relativo à pasta do script)
SQL_FILE="$(dirname "$0")/../../src/db/safeworklite-dump.sql"

# Defina o caminho completo para o executável MySQL dentro do XAMPP
MYSQL_PATH="/opt/lampp/bin/mysql"

# Primeiro, crie o banco de dados, se não existir
"$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" --port="$DB_PORT" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Agora, execute o arquivo SQL no banco de dados
"$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" --port="$DB_PORT" "$DB_NAME" < "$SQL_FILE"

echo "Banco de dados e tabelas criados com sucesso."
