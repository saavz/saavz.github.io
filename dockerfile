# Usa una imagen oficial de Apache HTTP Server
FROM httpd:latest

# Instala Git para poder clonar el repositorio
# Actualiza la lista de paquetes, instala git y limpia la caché de apt
RUN apt-get update && apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Limpia el directorio de contenido web por defecto de Apache
RUN rm -rf /usr/local/apache2/htdocs/*

# Clona tu repositorio desde GitHub al directorio web de Apache
# Asegúrate que la URL sea la correcta para tu proyecto Solemne1
RUN git clone https://github.com/saavz/saavz.github.io.git /usr/local/apache2/htdocs/

# Expone el puerto 80 para el tráfico web
EXPOSE 80

# Inicia Apache en primer plano (este es el comando por defecto de la imagen base httpd)
# Se incluye para ser explícito, siguiendo el estilo de tu ejemplo.
CMD ["httpd-foreground"]
