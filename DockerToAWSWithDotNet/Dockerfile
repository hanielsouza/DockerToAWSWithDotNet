#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["DockerToAWSWithDotNet/DockerToAWSWithDotNet.csproj", "DockerToAWSWithDotNet/"]
RUN dotnet restore "DockerToAWSWithDotNet/DockerToAWSWithDotNet.csproj"
COPY . .
WORKDIR "/src/DockerToAWSWithDotNet"
RUN dotnet build "DockerToAWSWithDotNet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DockerToAWSWithDotNet.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://+:80
ENTRYPOINT ["dotnet", "DockerToAWSWithDotNet.dll"]