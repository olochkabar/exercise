#!/bin/bash

# To replace the placeholder in index.html with the value of NUMBER
envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html.temp
mv /usr/share/nginx/html/index.html.temp /usr/share/nginx/html/index.html

# To start nginx in the foreground
nginx -g 'daemon off;'


