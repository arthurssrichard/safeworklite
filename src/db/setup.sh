#!/bin/bash

# Defina os parâmetros de conexão do MySQL/MariaDB
DB_USER="labdatabase"
DB_PASS="lab@Database2022"
DB_HOST="127.0.0.1"
DB_PORT="3306"  # Porta correta
DB_NAME="safeworklite"  # Nome do banco de dados

# Defina o caminho correto para o arquivo SQL (relativo à pasta do script)
SQL_FILE="$(dirname "$0")/../../src/db/safeworklite-dump.sql"
SEED_FILE="$(dirname "$0")/../../src/db/seeder.sql"

# Defina o caminho completo para o executável MySQL no CentOS
MYSQL_PATH="/usr/bin/mysql"

# Primeiro, crie o banco de dados, se não existir
"$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" --port="$DB_PORT" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Agora, execute o arquivo SQL no banco de dados
"$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" --port="$DB_PORT" "$DB_NAME" < "$SQL_FILE"

# Verifica se o arquivo seeder.sql existe e insere os dados
if [ -f "$SEED_FILE" ]; then
    "$MYSQL_PATH" -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" --port="$DB_PORT" "$DB_NAME" < "$SEED_FILE"
    echo "Dados inseridos com sucesso a partir de seeder.sql."
else
    echo "Arquivo seeder.sql não encontrado."
fi

echo "Banco de dados, tabelas e dados criados/inseridos com sucesso."
