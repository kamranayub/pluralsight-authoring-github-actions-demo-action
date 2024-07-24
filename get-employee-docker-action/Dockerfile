FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# For GitHub Actions, you should not use the WORKDIR directive
# See: https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#workdir
# WORKDIR /src

# Copy everything from src to root of the container
COPY ./src ./

# Restore as distinct layers
RUN cd src && \
    dotnet restore

# Build and publish a release
RUN cd src && \
    dotnet publish -c Release -o ../out

# Build runtime image
FROM mcr.microsoft.com/dotnet/runtime:8.0
COPY --from=build-env /out .
ENTRYPOINT ["dotnet", "./out/DotNetDockerAction.dll"]