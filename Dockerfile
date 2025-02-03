FROM alpine 
ARG APPNAME="schemasheets"
ARG GITHUBREPO="https://github.com/EVORA-project"
ARG DOCKERREPO="evoratools"
LABEL org.opencontainers.image.authors="d3fk"
LABEL org.opencontainers.image.source="$GITHUBREPO/$APPNAME.git"
LABEL org.opencontainers.image.url="$GITHUBREPO/$APPNAME"
LABEL org.opencontainers.image.base.name="docker.io/library/alpine"
LABEL org.opencontainers.image.title="$DOCKERREPO/$APPNAME"
LABEL org.opencontainers.image.version="linkml, version 1.8.5"
LABEL org.opencontainers.image.version="schemasheets, version 0.3.1"
LABEL org.opencontainers.image.description="Minimal container image base on Alpine linux \
embedding LinkML (allowing to author schemas in YAML, working with and validating data in \
 a variety of formats JSON, RDF, TSV, OWL, with generators for compiling LinkML \
 schemas to other frameworks) and the related schemasheets framework allowing to generate schema \
 specification from spreadsheets (Google Sheets, Excel)"

ARG EVORA_TAG=false

RUN apk upgrade --no-cache && apk add --no-cache py-pip \
    && pip install --break-system-packages schemasheets \
    && mkdir -m 777 /.local /.data /.config \
    # Conditional Fix for GitHub issue with equals_string_in ahead of PR integration if EVORA_TAG is true
    # solution imported from EVORA fork of LinkML: https://github.com/linkml/linkml/pull/2519
    && if [ "$EVORA_TAG" = "true" ]; then \
       wget -O /usr/lib/python3.12/site-packages/linkml/generators/owlgen.py https://raw.githubusercontent.com/EVORA-project/linkml/refs/heads/main/linkml/generators/owlgen.py; \
       fi \
    && adduser -SD $APPNAME 

USER $APPNAME

WORKDIR /workdir

CMD echo -e "\033[0;33m---\n\033[1;34mMain available commands in this container:\n\033[0;33m---\033[0;32m" \
	&& ls -1 /usr/bin/linkml* | xargs -n 1 basename \
	&& ls -1 /usr/bin/sheets* | xargs -n 1 basename \
	&& echo -e "\n\033[0;33m---\n\033[0;31mTo get detailed usage information, run the container with the desired command followed by '--help'.\n\033[0;33m---"\
	&& echo -e "\033[0;33mContainer usage:\n\033[0;35m  docker run --rm -u \$(id -u):\$(id -g) -v \$(pwd):/workdir evoratools/schemasheets COMMAND [OPTIONS] [ARGS] \n\033[0;33m---\n\\033[0m"
