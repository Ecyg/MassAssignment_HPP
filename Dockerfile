FROM ubuntu:latest

# Install Apache and PHP
RUN apt update && apt install -y apache2 php libapache2-mod-php && rm -rf /var/lib/apt/lists/*

# Set up a custom welcome page
RUN echo '<h1>Welcome to My Apache Server</h1>' > /var/www/html/index.html

# Add vulnerable PHP application
COPY vulnerable_app.php /var/www/html/vulnerable_app.php
COPY xss_hpp.php /var/www/html/xss_hpp.php

# Expose port 80
EXPOSE 80

# Keep Apache running in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
