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

# Allow environment variable parametrization
ENV JAVA_OPTS="-DALLOW_ENV_PARAMETRIZATION=true"
# Disable CSRF for initial setup
ENV GEOSERVER_CSRF_DISABLED=true
# Set the proxy base URL to your Railway deployment URL
ENV PROXY_BASE_URL=${RAILWAY_PUBLIC_DOMAIN}

# Install any additional dependencies if needed
USER root
RUN apt-get update && apt-get install -y postgresql-client

    # Switch back to geoserver user
USER geoserver

# Expose the default GeoServer port
EXPOSE 8080

# Start GeoServer
# CMD ["/opt/geoserver/bin/startup.sh"]