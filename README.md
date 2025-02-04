[![Docker Pulls](https://badgen.net/docker/pulls/evoratools/schemasheets?icon=docker&label=pulls&cache=600)](https://hub.docker.com/r/evoratools/schemasheets/tags) [![Docker Image Size](https://badgen.net/docker/size/evoratools/schemasheets/latest?icon=docker&label=image%20size&cache=600)](https://hub.docker.com/r/evoratools/schemasheets/tags) [![Docker build](https://img.shields.io/badge/automated-automated?style=flat&logo=docker&logoColor=blue&label=build&color=green&cacheSeconds=600)](https://hub.docker.com/r/evoratools/schemasheets/tags) [![Docker Stars](https://badgen.net/docker/stars/evoratools/schemasheets?icon=docker&label=stars&color=green&cache=600)](https://hub.docker.com/r/evoratools/schemasheets) [![Github Stars](https://img.shields.io/github/stars/EVORA-project/schemasheets?label=stars&logo=github&color=green&style=flat&cacheSeconds=600)](https://github.com/EVORA-project/schemasheets) [![Github forks](https://img.shields.io/github/forks/EVORA-project/schemasheets?logo=github&style=flat&cacheSeconds=600)](https://github.com/EVORA-project/schemasheets/fork) [![Github open issues](https://img.shields.io/github/issues-raw/EVORA-project/schemasheets?logo=github&color=yellow&cacheSeconds=600)](https://github.com/EVORA-project/schemasheets/issues) [![Github closed issues](https://img.shields.io/github/issues-closed-raw/EVORA-project/schemasheets?logo=github&color=green&cacheSeconds=600)](https://github.com/EVORA-project/schemasheets/issues?q=is%3Aissue+is%3Aclosed) [![GitHub license](https://img.shields.io/github/license/EVORA-project/schemasheets)](https://github.com/EVORA-project/schemasheets/blob/master/LICENSE)

# SchemaSheets Container (evoratools/schemasheets)

A lightweight container based on Alpine Linux, embedding the LinkML and SchemaSheets frameworks for seamless schema authoring, data validation, and conversion.

---

## 🛠 Image Information

This container image is automatically built and pushed as a multi-architecture image (linux/amd64, linux/arm64) through GitHub Actions.

- **Docker Image:** `evoratools/schemasheets`  
- **Image Tags on dockerhub:** [Available Tags](https://hub.docker.com/r/evoratools/schemasheets/tags)

  [![DockerHub Badge](https://dockeri.co/image/evoratools/schemasheets?cache=600)](https://hub.docker.com/r/evoratools/schemasheets)


### 🏷 Image Tag Details

- **Release Tags:** Follow the SchemaSheets version, ensuring compatibility with the corresponding release from the [official SchemaSheets repository](https://github.com/linkml/schemasheets).  
- **The `latest` Tag:** Always points to the highest available SchemaSheets version.  
- **EVORA Tags:** Custom versions tailored for the EVORA project, integrating some LinkML updates before their official merge (e.g., [linkml PR #2519](https://github.com/linkml/linkml/pull/2519)). Source code is available from the EVORA fork of LinkML: [EVORA-project/linkml](https://github.com/EVORA-project/linkml/tree/main/linkml).  

---

## 🚀 Usage Overview

The container includes LinkML and SchemaSheets official pip packages, enabling users to:
- Author schemas in YAML  
- Work with and validate data formats (JSON, RDF, TSV, OWL)  
- Generate schema specifications from spreadsheets (Google Sheets, Excel)  

### Basic Container Usage

#### Check the LinkML Version embeded in the container

To check the installed LinkML version in the container simply use the linkml command from the container

```sh
docker run --rm evoratools/schemasheets:latest linkml --version
```

#### To explore available commands with a basic structured run for being ready to go thurther:  

Running the container without arguments displays help information, including available commands:

```sh
docker run --rm -u $(id -u):$(id -g) -v $(pwd):/workdir evoratools/schemasheets

```

-  `--rm`: Automatically removes the container when it stops.
- `-u`: Ensures container processes match your user ID for proper file permissions as the evoratools/schemasheets container images follows best practices by running with a non-root user.
- `-v`: Mounts your working directory at `/workdir` inside the container.


---

## 🧩 Common Tasks

### Generate a LinkML Schema from a Google Sheet

```sh
docker run --rm -v $(pwd):/workdir -u $(id -u):$(id -g) evoratools/schemasheets:0.3.1 \
sheets2linkml --gsheet-id {YOUR_GSHEET_ID} \
--name {YOUR_SCHEMA_NAME} \
{SHEET1_NAME} {SHEET2_NAME} ... \
-o {RELATIVE_PATH_TO_SCHEMA.yaml}
```

### Generate an OWL File from a YAML Schema
```sh
docker run --rm -v $(pwd):/workdir -u $(id -u):$(id -g) evoratools/schemasheets:0.3.1 \
linkml generate owl \
{PATH_TO_SCHEMA.yaml} \
> {OUTPUT_OWL_FILE.owl.ttl}

```

---

## 📦 Multiarch & Tag Support

Built for multiple architectures: `linux/amd64`, `linux/arm64`.
Explore available tags here: [DockerHub Tags](https://hub.docker.com/r/evoratools/schemasheets/tags).

---

## [![GitHub license](https://img.shields.io/github/license/EVORA-project/schemasheets)](https://github.com/EVORA-project/schemasheets/blob/master/LICENSE) License
This project is licensed under the [MIT License](https://github.com/EVORA-project/schemasheets/blob/main/LICENSE).
You are free to use, modify, and distribute this project as permitted under the terms of the license.

---
