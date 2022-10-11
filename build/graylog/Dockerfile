FROM graylog/graylog:4.3-jre11

USER root

# Copy cacerts inside container to /etc/graylog/server/certs/cacerts
CMD cp -a /opt/java/openjdk/lib/security/cacerts /usr/share/graylog/ssl/cacerts

# Send Wazuh SSL certs to Graylog
COPY ssl/wazuh/root-ca.pem /usr/share/graylog/ssl/root-ca.pem

# Set owner of ssl directory to graylog
RUN chown -R graylog:graylog /usr/share/graylog/ssl/

# Add self-signed certificate into the key store
RUN keytool -importcert -keystore /usr/share/graylog/ssl/cacerts -storepass changeit -alias graylog-self-signed -file /usr/share/graylog/ssl/root-ca.pem -noprompt

USER graylog