# Evitar prompts interactivos durante la instalación

ENV DEBIAN_FRONTEND=noninteractive



# Instalar Apache, MySQL, PHP y git

RUN apt-get update && apt-get install -y \

  apache2 \

  mysql-server \

  php \

  libapache2-mod-php \

  php-mysql \

  git



# Clonar tu repositorio (ajustado para tu proyecto)

RUN git clone https://github.com/saavz/saavz.github.io.git /tmp/repo



# Mover solo la carpeta con la web al directorio de Apache

RUN rm -rf /var/www/html && \

  mv /tmp/repo/cafeteria-don-gato/public /var/www/html



# Exponer el puerto 80

EXPOSE 80



# Iniciar Apache y MySQL al arrancar el contenedor

CMD service mysql start && apache2ctl -D FOREGROUND
