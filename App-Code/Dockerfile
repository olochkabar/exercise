
# Use the official Nginx image from Docker Hub
FROM nginx:1.21.4

#install curl
RUN apt-get update && apt-get install -y curl


#Copy the static files to Nginx web directory
COPY index.html /usr/share/nginx/html

COPY page1.html /usr/share/nginx/html

COPY page2.html /usr/share/nginx/html

#Expose port 80
EXPOSE 80

#copy entrypoint bash script
COPY entrypoint.sh /entrypoint.sh

#make the entrypoint bash script executable
RUN chmod +x /entrypoint.sh

# Start Nginx server with the entrypoint bash script
ENTRYPOINT ["/entrypoint.sh"]

