# SafeWorkLite - Documentação de Configuração

Este guia descreve os passos para configurar e executar o projeto SafeWorkLite em um ambiente CentOS. Siga atentamente as etapas abaixo para garantir que tudo esteja funcionando corretamente.
Vídeo do youtube demonstrando projeto: [https://youtu.be/GdbUlvkJFZ8] | Diagrama relacional está localizado em /src/db
> **OBS:** Caso queira ver especificamente comandos SQL, eles estão localizados nas classes DAO, no diretório /src/main/java/dao
## Requisitos

- **CentOS** instalado com **Java** e **MySQL**.
- Acesso ao terminal como **superusuário** para instalação de pacotes.

## Passo a Passo

### 1. Clonar o Repositório

Abra o terminal e execute o seguinte comando para clonar a branch específica do projeto:
```bash
git clone -b CentOS https://github.com/arthurssrichard/safeworklite.git
```
> **Nota:** No exemplo, o repositório foi clonado na pasta `Documents`, mas você pode escolher a localização desejada.

### 2. Instalar Maven

Instale o Maven em sua máquina. A versão mínima recomendada é a **3.8.5**. Para instalar a versão correta, siga os passos abaixo:

```bash
wget https://archive.apache.org/dist/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar xzvf apache-maven-3.8.5-bin.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.8.5 /opt/maven
```

Adicione o Maven ao PATH do sistema editando o arquivo `.bashrc`:

```bash
echo "export M2_HOME=/opt/maven" >> ~/.bashrc
echo "export PATH=\$M2_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

### 3. Build do Projeto

Dentro do diretório do projeto SafeWorkLite, execute o comando para limpar e construir o projeto com o Maven:

```bash
cd safeworklite
mvn clean install
```

### 4. Configuração do Tomcat

1. Acesse o diretório do Tomcat.
2. Dê permissões de execução para os arquivos da pasta `bin`:

   ```bash
   chmod +x bin/*
   ```

3. Crie a pasta `logs` dentro do diretório do Tomcat, caso não exista:

   ```bash
   mkdir logs
   ```

### 5. Deploy do Projeto no Tomcat

1. Navegue até o diretório `target` dentro do SafeWorkLite.
2. Copie o arquivo WAR gerado para a pasta `webapps` do Tomcat:

   ```bash
   cp SafeWorkManagerLite.war ../src/apache-tomcat-9.0.95/webapps
   ```
   > **Nota:** Caso o arquivo WAR não seja gerado, execute o `mvn update` no diretório do projeto.

### 6. Executar o Script de Configuração do Banco de Dados

1. Vá até o diretório onde se encontra o script `setup.sh`.
2. Execute o script para criar as tabelas no banco de dados e preencher alguns dados: (src/db/setup.sh)

   ```bash
   ./setup.sh
   ```

### 7. Iniciar o Tomcat

Inicie o servidor Tomcat utilizando o comando:

```bash
apache-tomcat-9.0.95/bin/startup.sh
```

Depois disso, você poderá acessar o sistema no navegador pelo endereço:

```
http://localhost:8080/SafeWorkManagerLite/
```
> **Nota:** Ao acessar essa URL, você será redirecionado automaticamente para a página de login.

### Comandos Adicionais

- Para reiniciar o Tomcat:

  ```bash
  apache-tomcat-9.0.95/bin/shutdown.sh
  apache-tomcat-9.0.95/bin/startup.sh
  ```

### Observações Finais

- Sempre execute `mvn clean install` ou `mvn update` dentro do diretório SafeWorkLite, sempre que houver alterações no código.
- Se precisar reiniciar o Tomcat, siga as instruções acima para garantir que as alterações sejam aplicadas corretamente.

