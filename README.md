# schemasheets (evoratools/schemasheets)

A minimal container image based on Alpine Linux embedding LinkML and the schemasheets framework.

Image name: **evoratools/schemasheets**

`docker pull evoratools/schemasheets`

Docker Hub repository: https://hub.docker.com/r/evoratools/schemasheets

## Usage

This container includes LinkML and schemasheets, allowing you to author schemas in YAML, work with and validate data in various formats (JSON, RDF, TSV, OWL), and generate schema specifications from spreadsheets (Google Sheets, Excel).



### Docker usage

To run the container and list available commands:

```sh
docker run --rm -u $(id -u):$(id -g) -v $(pwd):/workdir evoratools/schemasheets:0.3.1

```
The `--rm` option will delete the container on stop. The `-u` option intends to provide your user id and group in order to be able to have enough right on the mounted work directory.

The `-v` allows to mount your working directory into the `/workdir` directory of the container.


To generate a LinkML schema from a Google Sheet with schemasheets:
```sh
docker run --rm -v $(pwd):/workdir -u $(id -u):$(id -g) evoratools/schemasheets:0.3.1  \
sheets2linkml --gsheet-id {YOUR_GSHEET_ID} \
--name {YOUR_SCHEMA_NAME} \
{SHEET1_NAME} {SHEET2_NAME} .... \
-o {YOUR_RELATIVE_PATH_IN_WORKDIR/TO_YOUR_SCHEMA_FILE_OUTPUT.yaml}
```


To generate an OWL file from a YAML schema:
```sh
docker run --rm -v $(pwd):/workdir -u $(id -u):$(id -g) evoratools/schemasheets:0.3.1 \
linkml generate owl \
{YOUR_PATH_IN_WORKDIR/TO_YOUR_SCHEMA_FILE.yaml} \
> {YOUR_PATH_IN_WORKDIR/TO_YOUR_OWL_FILE_OUTPUT.owl.ttl}
```


To get detailed usage information, run the container with the desired command followed by --help.


## Available commands

When running the container without arguments, it provides some help information including available commands, e.g:

```sh
---
Main available commands in this container:
---
linkml
linkml-apply
linkml-convert
linkml-jsonschema-validate
linkml-lint
linkml-normalize
linkml-run-examples
linkml-schema-fixer
linkml-sparql-validate
linkml-sqldb
linkml-validate
linkml2schemasheets-template
linkml2sheets
sheets2linkml
sheets2project

---
To get detailed usage information, run the container with the desired command followed by '--help'.
---
Container usage:
  docker run --rm -u $(id -u):$(id -g) -v $(pwd):/workdir evoratools/schemasheets COMMAND [OPTIONS] [ARGS]

```

