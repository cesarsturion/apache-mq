FROM openjdk:8-jre-alpine
WORKDIR /home/alpine
RUN apk update && apk add wget
RUN wget -O amq.tar.gz http://apachemirror.wuchna.com/activemq/activemq-artemis/2.16.0/apache-artemis-2.16.0-bin.tar.gz && tar -xvf amq.tar.gz
EXPOSE 8161 61616 5672 61613 1833
RUN apache-artemis-2.16.0/bin/artemis create veloe-broker \
    --user admin \
    --password admin \
    --role amq \
    --require-login \
    --clustered \ 
    --host '${ipv4addr:localhost}' \
    --cluster-user veloe-cluster \
    --cluster-password admin
COPY start.sh .
RUN chmod +x start.sh
#CMD ["./start.sh"]