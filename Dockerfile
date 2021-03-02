FROM mcr.microsoft.com/powershell:7.1.2-alpine-3.12-20210211

COPY entrypoint.ps1 /

ENTRYPOINT [ "pwsh", "-File", "/entrypoint.ps1"]
