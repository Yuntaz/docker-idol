# Docker images for HPE IDOL
HPE IDOL is a search engine with machine learning built to handle all kind of information, structured (office docs, databases and more) and unstructured (social media, video, audio and more).
**To run it, you will need a valid HPE IDOL license not provided here.** See below how to contact us if you want to see IDOL working.
**If you are a customer from HPE IDOL, you can use your current IDOL license** to test the new version or just to use this software as your license says to do it.

## Branches & Operating systems. 
We provide here a container over CentOS7 with an HPE IDOL 11.4 installation. 

## Usage
You can use theses images on the following way:

```
    docker run -it yuntaz/idol:latest
```
'
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
