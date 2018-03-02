FROM openjdk:8

LABEL maintainer="Darren Wu <darrenchwu@gmail.com> (@darrenchwu)"

RUN apt-get update && apt-get install -y supervisor && \
   rm -rf /var/lib/apt/lists/* && \
   sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

EXPOSE 9001

##Move the following commands to docker-compose for better good
#ADD docker-config/pt-supervisord.conf /etc/supervisor/conf.d/pt-supervisord.conf
#CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
