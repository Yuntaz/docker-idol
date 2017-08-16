# Docker images for HPE IDOL
HPE IDOL is a search engine with machine learning built to handle all kind of information, structured (office docs, databases and more) and unstructured (social media, video, audio and more).
**To run it, you will need a valid HPE IDOL license which is not provided here.** See below how to contact us if you want to see IDOL working.
**If you are a customer from HPE IDOL, you can use your current IDOL license** to test the new version or just to use this software as your license says to do it.

## Branches & Operating systems. 
We provide here a container over CentOS7 with an HPE IDOL 11.4 installation. 

## Usage
You can use theses images on the following way:

```
docker run -it --rm -p 7000:7000 -p 17000:17000 -p 7025:7025 -p 17025:17025 -p 7026:7026 -p 17026:17026 -p 7027:7027 -p 17027:17027 -p 7028:7028 -p 17028:17028 -p 7029:7029 -p 17029:17029 -p 9020:9020 -p 9022:9022 -p 9030:9030 -p 9050:9050 -p 9080:9080 -p 9100:9100 -p 9101:9101 -p 9102:9102 -p 8080:8080 -p 20000:20000 yuntaz/idol:latest
```

## How to fuild from Dockerfile
Use following command:
```
docker build -f Dockerfile -t yuntaz/idol:<version> .
```

## Author				 
Yuntaz is an HPE big data partner from Mexico.
If you want to know more about IDOL platform, let's talk at [hi@yuntaz](mailto:hi@yuntaz.com)

# Copyright Notice about HPE IDOL and the License
HPE IDOL is a commercial software from Hewlett Packard Enterprise Development LP. 
To run this docker image you will need a valid license from Hewlett Packard Enterprise.
Here we don't provide a valid license. If you want to run it, please contact us as registerd partner from HPE at [hi@yuntaz](mailto:hi@yuntaz.com)
Restricted Rights Legend: Confidential computer software. Valid license from HPE required for possession, use or copying. 
Consistent with FAR 12.211 and 12.212, Commercial Computer Software, Computer Software Documentation, and
Technical Data for Commercial Items are licensed to the U.S. Government under vendor's standard commercial license.