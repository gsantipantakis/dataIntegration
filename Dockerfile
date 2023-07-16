# Use the OpenJDK 17 image as the base image
FROM openjdk:17
FROM python:3.8-slim-buster

# Create app directories
RUN mkdir /dataIntegration
RUN mkdir /dataIntegration/datasets
RUN mkdir /dataIntegration/datasets/AIS
RUN mkdir /dataIntegration/datasets/GRB
RUN mkdir /input
RUN mkdir /enriched
RUN mkdir /tmp

# Copy the app files from host machine to image filesystem
COPY dist/ /dataIntegration
## use your .cdsapirc file
COPY .cdsapirc /dataIntegration

# Set the directory for executing future commands
WORKDIR /dataIntegration

CMD apt install python3-pip
CMD pip install cdsapi

# run with: docker run --rm -it --entrypoint bash <image-name-or-id>
# test using
#$ java -jar mobiSpaces_Toolset.jar
