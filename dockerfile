FROM ubuntu:16.04
MAINTAINER qarj

#Setup basic environment
ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US.UTF-8

#Update system and install packages
RUN [ "apt-get", "-q", "update" ]
RUN [ "apt-get", "-qy", "--force-yes", "upgrade" ]
RUN [ "apt-get", "-qy", "--force-yes", "dist-upgrade" ]
RUN [ "apt-get", "install", "-qy", "--force-yes", \
      "perl", \
      "build-essential", \
      "cpanminus", \
      "git" ]

# Needed to install XML::Simple      
RUN ["apt-get", "install", "-qy", "--force-yes", "libexpat1-dev"]

# Needed to install LWP::Protocol::https     
RUN ["apt-get", "install", "-qy", "--force-yes", "libssl-dev"]

RUN [ "apt-get", "clean" ]
RUN [ "rm", "-rf", "/var/lib/apt/lists/*", "/tmp/*", "/var/tmp/*" ]

#Install cpan modules
RUN ["cpanm", "File::Slurp" ]
RUN ["cpanm", "Data::Dumper" ]
RUN ["cpanm", "LWP" ]
RUN ["cpanm", "XML::Simple" ]
RUN ["cpanm", "Math::Random::ISAAC" ]
RUN ["cpanm", "LWP::Protocol::https" ]

#Clone the WebInject Project
WORKDIR /app
RUN ["git", "clone", "--progress", "--verbose", "https://github.com/Qarj/WebInject", "/app/WebInject"]

RUN ["ls", "-asl"]
WORKDIR /app/WebInject
RUN ["pwd"]
RUN ["ls", "-asl"]

#Make executable
RUN [ "chmod", "+x",  "webinject.pl" ]

#Display help
RUN [ "./webinject.pl", "--help" ]

#Set entrypoint of script.pl
ENTRYPOINT [ "/app/WebInject/webinject.pl" ]

