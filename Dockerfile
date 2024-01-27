
# Use the offcial Nginx image from Docker Hub
FROM nginx:1.21.4

# Copy the static files to Nginx web directory
RUN apt-get update && apt-get install -y curl

COPY index.html /usr/share/nginx/html

COPY page1.html /usr/share/nginx/html

COPY page2.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

#copy entrypoint bash script
COPY entrypoint.sh /entrypoint.sh

#make the bash script executable
RUN chmod +x /entrypoint.sh


# Start Nginx server with bash script
ENTRYPOINT ["/entrypoint.sh"]

