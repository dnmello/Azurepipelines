FROM mcr.microsoft.com/dotnet/core/sdk:3.1.202-bionic

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libunwind8 \
        netcat \
        gettext-base \
        apt-transport-https \
        ca-certificates \
        software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
        && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        && apt-get update \
        && apt-get install docker-ce docker-ce-cli containerd.io

WORKDIR /azp

COPY ./dockeragent/start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]