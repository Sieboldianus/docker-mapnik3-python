FROM jawg/mapnik3:3.0

ENV PYTHON_BINDINGS=" \
    autoconf \
    apache2-dev \
    libtool \
    libxml2-dev \ 
    libbz2-dev \
    libgeos-dev \ 
    libgeos++-dev \
    gdal-bin \
    python3 \
    python3-pip \
    python3-mapnik \ 
    python3-psycopg2 \
    python3-yaml"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        $PYTHON_BINDINGS