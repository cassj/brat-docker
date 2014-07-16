# start from a base ubuntu image
FROM ubuntu
MAINTAINER Cass Johnston <cassjohnston@gmail.com>

# Install pre-reqs
RUN apt-get update
RUN apt-get install -y curl vim
RUN apt-get install -y apache2
RUN apt-get install -y python
RUN apt-get install -y supervisor

# Fetch  brat
RUN mkdir /var/www/brat
RUN curl http://weaver.nlplab.org/~brat/releases/brat-v1.3_Crunchy_Frog.tar.gz > /var/www/brat/brat-v1.3_Crunchy_Frog.tar.gz 
RUN cd /var/www/brat && tar -xvzf brat-v1.3_Crunchy_Frog.tar.gz

# And configure it
ADD config.py /var/www/brat/brat-v1.3_Crunchy_Frog

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

# Fix the ulimit issue 
ADD limits.conf /etc/security/limits.conf

# Enable cgi
RUN a2enmod cgi

EXPOSE 80

# We can't use apachectl as an entrypoint because it starts apache and then exits, taking your container with it. 
# Instead, use supervisor to monitor the apache process
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

CMD ["/usr/bin/supervisord"]





