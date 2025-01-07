# Use the official GeoServer image
FROM docker.osgeo.org/geoserver:2.25.3

# Environment variables for PostGIS connection
ENV POSTGRES_DB=railway
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=Ea65EDd236fAGF2bg4fG1CDA4g34adgc
ENV POSTGRES_HOST=postgis.railway.internal
ENV POSTGRES_PORT=5432

# Optional: Set GeoServer admin credentials
ENV GEOSERVER_ADMIN_USER=admin
ENV GEOSERVER_ADMIN_PASSWORD=geoserver

# Optional: Configure Java options
ENV EXTRA_JAVA_OPTS="-Xms512m -Xmx2g"

# Expose the default GeoServer port
EXPOSE 8080