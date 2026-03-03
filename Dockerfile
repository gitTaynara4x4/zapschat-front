FROM nginx:alpine

# Copia sua página de manutenção
COPY maintenance.html /usr/share/nginx/html/maintenance.html

# Copia sua config do nginx (substitui a default do container)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# HEALTHCHECK: testa o endpoint interno do próprio nginx (não depende do backend)
# Se isso falhar, o container fica unhealthy.
HEALTHCHECK --interval=15s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1/__alive >/dev/null 2>&1 || exit 1