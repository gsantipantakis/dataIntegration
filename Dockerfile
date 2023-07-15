# Use the OpenJDK 17 image as the base image
FROM openjdk:17

# Create a new app directory
RUN mkdir /dataIntegration

# Copy the app files from host machine to image filesystem
COPY dist/ /dataIntegration

# Set the directory for executing future commands
WORKDIR /dataIntegration

# run with: docker run --rm -it --entrypoint bash <image-name-or-id>
# test using
#$ java -jar mobiSpaces_Toolset.jar
