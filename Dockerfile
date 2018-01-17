FROM microsoft/iis
RUN powershell Install-WindowsFeature NET-Framework-45-ASPNET 
RUN powershell Install-WindowsFeature Web-Asp-Net45
RUN powershell New-Item -ItemType Directory -Path c:\\inetpub\\wwwroot\\DockerTestWebApplication
COPY DockerTestWebApplication\\DockerTestWebApplication c:\\inetpub\\wwwroot\\DockerTestWebApplication
RUN powershell New-WebApplication -Name DockerTestWebApplication -Site 'Default Web Site' -PhysicalPath 'C:\inetpub\wwwroot\DockerTestWebApplication\' -ApplicationPool DefaultAppPool
