
# Use the offcial Nginx image from Docker Hub
FROM nginx:1.21.4

#install curl
RUN apt-get update && apt-get install -y curl


# Copy the static files to Nginx web directory
COPY index.html /usr/share/nginx/html

COPY page1.html /usr/share/nginx/html

COPY page2.html /usr/share/nginx/html

#copy entrypoint bash script
COPY entrypoint.sh /entrypoint.sh

#make the bash script executable
RUN chmod +x /entrypoint.sh

# Expose port 80
EXPOSE 80

# Start Nginx server with bash script
ENTRYPOINT ["/entrypoint.sh"]

