FROM nginx:alpine

# Copia sua config como default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Página de manutenção (quando API cair)
COPY maintenance.html /usr/share/nginx/html/maintenance.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]