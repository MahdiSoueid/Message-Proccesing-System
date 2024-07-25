FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set up the work directory
WORKDIR /inetpub/wwwroot

# Copy the application files
COPY . .

# Expose the necessary ports
EXPOSE 80