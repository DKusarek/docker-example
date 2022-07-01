FROM mcr.microsoft.com/dotnet/sdk:latest AS build
WORKDIR /build  
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o output
FROM mcr.microsoft.com/dotnet/aspnet:latest
WORKDIR /app
COPY --from=build /build/output .
ENTRYPOINT ["dotnet", "docker-example.dll"]