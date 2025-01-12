# Use the official GeoServer image
FROM docker.osgeo.org/geoserver:2.25.3

# Environment variables for PostGIS connection
ENV POSTGRES_DB=railway
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=Ea65EDd236fAGF2bg4fG1CDA4g34adgc
ENV POSTGRES_HOST=postgis.railway.internal
ENV POSTGRES_PORT=5432
ENV GEOSERVER_ADMIN_PASSWORD=geoserver
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN=admin
ENV GEOSERVER_PASSWORD=geoserver

# ENV GEOSERVER_WEB_UI_LOCATION=https://${RAILWAY_PUBLIC_DOMAIN}/geoserver/
# ENV GEOSERVER_PUBLIC_LOCATION=https://${RAILWAY_PUBLIC_DOMAIN}/geoserver/
# ENV GEOSERVER_LOCATION=http://localhost:8080/geoserver/

# CORS Configuration
ENV CORS_ENABLED=true
ENV CORS_ALLOWED_ORIGINS=*
ENV CORS_ALLOWED_METHODS=GET,POST,PUT,DELETE,HEAD,OPTIONS
ENV CORS_ALLOWED_HEADERS=Origin,Accept,X-Requested-With,Content-Type,Access-Control-Request-Method,Access-Control-Request-Headers
ENV CORS_ALLOW_CREDENTIALS=false

# Allow environment variable parametrization
ENV JAVA_OPTS="-DALLOW_ENV_PARAMETRIZATION=true"
ENV GEOSERVER_CSRF_DISABLED=true
ENV PROXY_BASE_URL=${RAILWAY_PUBLIC_DOMAIN}

# Install any additional dependencies if needed
USER root
RUN apt-get update && apt-get install -y postgresql-client

# Copy the custom web.xml file (cursor path)
COPY src/web/app/src/main/webapp/WEB-INF/web.xml /opt/geoserver/webapps/geoserver/WEB-INF/web.xml
# Copy the custom web.xml file (my path, from perplexity)
COPY src/web/app/src/main/webapp/WEB-INF/web.xml /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml
# # Copy the custom web.xml file (my path, from perplexity)
# COPY src/web/app/src/main/webapp/WEB-INF/web.xml /opt/config_overrides/web.xml

# Expose the default GeoServer port
EXPOSE 8080

# # Start GeoServer
# CMD ["/opt/geoserver/bin/startup.sh"]