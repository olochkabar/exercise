#!/bin/bash

#envsubst < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html


# Replace the placeholder in index.html with the value of NUMBER
envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html.temp
mv /usr/share/nginx/html/index.html.temp /usr/share/nginx/html/index.html

# Start nginx in the foreground
nginx -g 'daemon off;'


