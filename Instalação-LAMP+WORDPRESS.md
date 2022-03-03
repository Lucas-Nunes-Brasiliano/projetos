## Tutorial de da instalação em ambiente Linux
#Considere se logar com uma conta root, além de dar permissão adquada evitar a repetição do comando sudo

> sudo su

#Ulizaremos o banco de dados MariaDB, para isso em seu terminal digite o comando:

> apt install mariadb-server

#Inicializando o banco de dados

> systemctl start mariadb

#O comando abaixo verifica a situação do banco de dados

> systemctl status mariadb

#Em seguida, emita o comando para ativar as configurações de segurança, incluindo a adição de uma senha.
#Esta é a principal conta de usuário para acessar o banco de dados.

> mysql_secure_installation

#senha a ser digitada
#password do mysql_secure: use uma senha forte aqui letras, números, caracteres

# Criando um banco de dados

> mysql -u root -p

#A senha digitada anteriormente para a conta raiz do banco será necessária, abaixo o comando para criar um tabela no banco de dados

> CREATE DATABASE nome da table DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

> GRANT ALL PRIVILEGES ON nome da tabela.* TO 'nome do usuário'@'localhost' IDENTIFIED BY 'senha do usuário';

#Use uma senha forte aqui letras, números, caracteres

#definirá as permissões necessárias para o usuário raiz

> FLUSH PRIVILEGES;

> EXIT;
______________________________________________________
## Instalando o Apache

> apt install apache2

#Assim como no banco de dados, inicie o serviço apache2

> systemctl start apache2
> systemctl status apache2
______________________________________________________
## Instalando o PHP

> apt install php libapache2-mod-php php-mysql

> apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-cli php-cgi

#Vamos criar um arquivo teste e verificar se nossa instalação PHP é bem sucedida.
#Fica a seu critério usar o editor de texto que lhe agrada

> nano /var/www/html/info.php

#Digite no arquivo o código abaixo, feche-o e salve
> <?php 
> phpinfo();
> ?>

#Abra um navegador e vá para o endereço localhost/info.php
#Caso apareça informação sobre o php a instalação foi bem sucedida
#Em caso de dúvida consulte a documentação oficial em https://www.php.net/manual/en/install.unix.apache2.php
___________________________________________________________
#No terminal altere a configuração do arquivo abaixo

> nano /etc/apache2/apache2.conf

#Em Directy /var/wwww> 
#Alterar AllowOverride None para AllowOverride All

#Digite o comando

> a2enmod rewrite

#Apois essas alterações reset o sistema

> systemctl restart apache2
______________________________________________________________
## Baixando o wordpress

#Digite o comando 

> cd /tmp

#Fazendo o Download do arquivo em seguida extraindo 

> wget -c http://wordpress.org/latest.tar.gz
> tar -xzvf latest.tar.gz

#Acessando a pasta wordpress e criando o arquivo .htaccess

> cd worpress/
> cat .htaccess

#Criando o wp-config.php

> cp wp-config-sample.php wp-config.php

#Criando uma pasta para upgrade

> mkdir -v wp-content/upgrade

#Transferindo os arquivos para a pasta html

> cp -a * /var/www/html/

#Na pasta html delete o arquivo rm info.php e altere as permissões dos itens

> cd /var/www/html/
> rm info.php

#Alterando as configurações de usuário e permissões

> chown -R www-data:www-data *
> chmod -R 755 *

#Editando o arquivo wp-config.php

> nano wp-config.php

define('DB_NAME', 'nome da tabela');
define('DB_USER', 'nome do usuário');
define('DB_PASSWORD', 'senha do usuário');

#Acrescente no mesmo arquivo, abaixo dos demais

define( 'FS_METHOD', 'direct' );

#Em seguida feche e salve o arquivo
#Abra seu navegador e digite localhost/wp-admin/ e finalize a instalação do wordpress 
