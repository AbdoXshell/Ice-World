# Use a lightweight web server image
FROM nginx:alpine

# Remove default static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy project files into the nginx web root
COPY . /usr/share/nginx/html

# Expose default HTTP port
EXPOSE 80

# Rely on default nginx CMD

