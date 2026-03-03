FROM nginx:alpine

# Substitui o default.conf do nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Página de manutenção (estática)
COPY maintenance.html /usr/share/nginx/html/maintenance.html