FROM nginx:alpine

# Nosso nginx.conf vira o default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Página de manutenção
COPY maintenance.html /usr/share/nginx/html/maintenance.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]