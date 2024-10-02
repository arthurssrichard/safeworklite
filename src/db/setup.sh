#!/bin/bash

# Defina os parâmetros de conexão do MySQL/MariaDB
DB_USER="root"
DB_PASS=""
DB_HOST="127.0.0.1"

# Execute o arquivo SQL para criar o banco de dados e tabelas
mysql -u $DB_USER -p$DB_PASS -h $DB_HOST < db/safeworklite-dump.sql

echo "Banco de dados e tabelas criados com sucesso."
