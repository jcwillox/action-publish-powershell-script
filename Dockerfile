FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine3.13

COPY entrypoint.ps1 /

ENTRYPOINT [ "pwsh", "-File", "/entrypoint.ps1"]
