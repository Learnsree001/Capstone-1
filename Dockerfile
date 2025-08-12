--FROM ubuntu
--RUN apt-get update
--RUN apt-install apache2 -y
--ADD index.html /var/www/html/
--ENTRYPOINT apachectl -D FOREGROUND

# Use the latest Ubuntu image
FROM ubuntu:latest

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install Apache in a single layer
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom index.html into the web root
COPY index.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Run Apache in the foreground
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

