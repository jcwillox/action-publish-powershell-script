FROM mcr.microsoft.com/powershell:7.1.2-alpine-3.12-20210211

COPY entrypoint.ps1 /

RUN apt-get update \
    && apt-get install -y apt-transport-https wget \
    && wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install --y dotnet-sdk-5.0

ENTRYPOINT [ "pwsh", "-File", "/entrypoint.ps1"]
