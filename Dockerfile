FROM redhat/ubi9

# Install necessary packages
RUN yum install -y httpd wget unzip

# Set working directory
WORKDIR /var/www/html

# Download and extract the zip file
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip && \
    unzip listrace.zip && \
    mv listrace-v1.0/* . && \
    rm listrace.zip && \
    rm -r listrace-v1.0

# Start Apache httpd server
CMD ["httpd", "-DFOREGROUND"]

