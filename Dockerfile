# Use the OpenJDK 17 image as the base image
FROM openjdk:17
COPY --from=python:3.8 / /

# Create app directories
RUN mkdir /dataIntegration
RUN mkdir /dataIntegration/datasets
RUN mkdir /dataIntegration/datasets/AIS
RUN mkdir /dataIntegration/datasets/GRB
RUN mkdir /input
RUN mkdir /enriched

# Copy the app files from host machine to image filesystem
COPY dist/ /dataIntegration
## use your .cdsapirc file
COPY .cdsapirc /dataIntegration

# Set the directory for executing future commands
WORKDIR /dataIntegration

#CMD apt install python3-pip
RUN pip install --no-cache-dir -U cdsapi

# run with: docker run --rm -it --entrypoint bash <image-name-or-id>
# test using
#$ java -jar mobiSpaces_Toolset.jar
