FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin mriskwfadmin --silent
COPY lib/* /tmp/
COPY conf /tmp
RUN unzip /tmp/hibernate-orm-modules-5.2.5.Final-wildfly-10-dist.zip -d /opt/jboss/wildfly/modules/
RUN /tmp/execute.sh 
COPY files /opt/jboss/wildfly/standalone/data
USER root
RUN mkdir -p /var/local/halftau/storage \
    && chown jboss /var/local/halftau/storage \
    && chgrp jboss /var/local/halftau/storage
USER jboss
VOLUME /var/local/halftau/storage
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]