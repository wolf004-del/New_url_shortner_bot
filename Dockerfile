
FROM python:3.8-slim-buster

# Update and upgrade the system packages
RUN apt update && apt upgrade -y

# Install git
RUN apt install git -y

# Copy requirements.txt file to the root directory
COPY requirements.txt /requirements.txt

# Install dependencies from requirements.txt
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Create a directory for the application
RUN mkdir /UrlShortner-AutoFilter-Bot

# Set the working directory to the application directory
WORKDIR /UrlShortner-AutoFilter-Bot

# Copy the start.sh script to the application directory
COPY start.sh /UrlShortner-AutoFilter-Bot/start.sh

# Set execute permissions for the start.sh script
RUN chmod +x /UrlShortner-AutoFilter-Bot/start.sh

# Start the application using start.sh script
CMD ["/bin/bash", "/UrlShortner-AutoFilter-Bot/start.sh"]

# Expose the port used by the application
EXPOSE 8080
