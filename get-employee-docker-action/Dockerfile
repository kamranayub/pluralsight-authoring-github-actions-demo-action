FROM mcr.microsoft.com/dotnet/sdk:8.0@sha256:35792ea4ad1db051981f62b313f1be3b46b1f45cadbaa3c288cd0d3056eefb83 AS build-env

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
FROM mcr.microsoft.com/dotnet/runtime:8.0@sha256:6c4df091e4e531bb93bdbfe7e7f0998e7ced344f54426b7e874116a3dc3233ff
COPY --from=build-env /out .
ENTRYPOINT ["dotnet", "./out/DotNetDockerAction.dll"]