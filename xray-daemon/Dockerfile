FROM debian:stretch-slim
COPY ./xray /usr/bin/
COPY ./startup.sh /opt/

RUN apt update -y \
  && apt install -y python curl unzip \
  && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

CMD ["/opt/startup.sh"]
