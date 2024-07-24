FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# For GitHub Actions, you should not use the WORKDIR directive
# See: https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#workdir
# WORKDIR /src

# Copy everything from src to /App of the container
COPY ./src /App

# Restore as distinct layers
RUN cd /App && dotnet restore

# Build and publish a release
RUN cd /App && dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
# For GitHub Actions, you should not use the WORKDIR directive
# See: https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#workdir
# WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "/DotNetDockerAction.dll"]