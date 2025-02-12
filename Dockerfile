# Étape de construction
FROM node:20 AS builder

WORKDIR /app

# Copier les fichiers de dépendances
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm ci

# Copier le code source
COPY . .

# Construire l'application
RUN npm run build

# Étape finale
FROM nginx:stable

# Copier les fichiers construits
COPY --from=builder /app/dist/sakai-ng /usr/share/nginx/html

# Configuration Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Variables d'environnement
ENV SUPABASE_URL=$SUPABASE_URL
ENV SUPABASE_KEY=$SUPABASE_KEY

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]