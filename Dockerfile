FROM nginx:alpine

# Remove config padrão
RUN rm -f /etc/nginx/conf.d/default.conf

# Copia sua config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia a página de manutenção
COPY maintenance.html /usr/share/nginx/html/maintenance.html

# Healthcheck do próprio NGINX (não derruba)
HEALTHCHECK --interval=15s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1/__alive >/dev/null 2>&1 || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]