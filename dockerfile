FROM ubuntu:22.04

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
RUN apt-get install -y curl libio-socket-ssl-perl libnet-ssleay-perl

RUN [ "apt-get", "clean" ]
RUN [ "rm", "-rf", "/var/lib/apt/lists/*", "/tmp/*", "/var/tmp/*" ]

#Install cpan modules
RUN ["cpanm", "File::Slurp" ]
RUN ["cpanm", "Data::Dumper" ]
RUN ["cpanm", "LWP" ]
RUN ["cpanm", "XML::Simple" ]
RUN ["cpanm", "Math::Random::ISAAC" ]
RUN ["cpanm", "LWP::Protocol::https" ]

#Clone the WebImblaze Project
WORKDIR /usr/local/bin
RUN ["git", "clone", "--progress", "--verbose", "https://github.com/Qarj/WebImblaze", "/usr/local/bin/WebImblaze"]

RUN ["ls", "-asl"]
WORKDIR /usr/local/bin/WebImblaze
RUN ["pwd"]
RUN ["ls", "-asl"]

#Make executable
RUN find . -type d -exec chmod a+rwx {} \;
RUN find . -type f -exec chmod a+rw {} \;
RUN [ "chmod", "+x",  "wi.pl" ]

#Display help
RUN [ "./wi.pl", "--help" ]

#Set entry point of script.pl
ENTRYPOINT [ "/usr/local/bin/WebImblaze/wi.pl" ]

