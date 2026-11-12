# Imagen base liviana de Nginx (requisito del proyecto)
FROM nginx:alpine

# Copia el sitio estático al directorio público de Nginx
COPY src/ /usr/share/nginx/html/

# Nginx escucha en el puerto 80 dentro del contenedor
EXPOSE 80

# Verifica periódicamente que el servicio responda
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -qO- http://localhost/ > /dev/null || exit 1
