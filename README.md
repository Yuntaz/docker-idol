# Docker images for HPE IDOL

Docker images collection for the HPE IDOL platform.
HPE IDOL is a search engine with machine learning built to handle all kind of information, structured (office docs, databases and more) and unstructured (social media, video, audio and more).
It's available with a demo licence. In this docker, you will need to provide it.

## Branches & Operating systems. 
Following IDOL/Operating systems versions are provided:

OS | Version | Branch |
--- | --- | --- |
**CentOS**| 7.0 | master |

## Usage

You can use theses images on the following way:

```
    docker run -p 7025:7025 yuntaz/idol:latest
```

## How to fuild from Dockerfile

Use following command:

```
    docker build -f Dockerfile -t yuntaz/idol:<version> .
```

## Author				 
Yuntaz is an HPE big data partner from Mexico.
If you want to know more about Vertica, let's talk hi@yuntaz.com