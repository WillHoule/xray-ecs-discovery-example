FROM 836833705587.dkr.ecr.us-east-2.amazonaws.com/nginx-base:latest

MAINTAINER Will Houle "houle.william@gmail.com"

COPY ./app /opt/app

RUN apt-get update \
  && apt-get install -y curl gnupg2 python curl unzip \
  && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
  && apt-get install nodejs \
  && npm install aws-xray-sdk \
  && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && rm -rf awscli-bundle* \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/app

CMD ["/usr/bin/bash","-x","startup.sh","2>&1 /var/log/startup.log"]
