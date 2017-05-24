FROM debian:stretch-slim
COPY ./xray /opt/xray

RUN apt update -y \
  && apt install -y python curl unzip ca-certificates \
  && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F \" '{print $4}'); curl https://s3.dualstack.$REGION.amazonaws.com/aws-xray-assets.$REGION/xray-daemon/aws-xray-daemon-2.x.deb -o aws-xray-daemon-2.x.deb \
  && dpkg -i aws-xray-daemon-2.x.deb \
  && rm --verbose aws-xray-daemon-2.x.deb \
  && chmod +x /opt/xray/startup.sh
  && apt remove -y unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

ENTRYPOINT ["/opt/xray/startup.sh"]
CMD ["/usr/bin/xray","--bind=0.0.0.0:2000"]