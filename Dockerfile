FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

IG_USER=postgres
IG_PASSWD=cpsc4973
PG_HOST=m6-image-gallery-database.cm6ntogsarqg.us-east-1.rds.amazonaws.com
PG_PORT=5432
IG_DATABASE=m6-image-gallery-database

RUN apt-get update -y && apt-get install -y git
RUN apt install openjdk-11-jre -y 

RUN git clone https://github.com/anthonyjmarchi/module6shadowjar.git 

WORKDIR /module6shadowjar

CMD ["java","-jar","java-image-gallery-all.jar"]

psql -d postgresql://$IG_USER:$IG_PASSWD@$PG_HOST:$PG_PORT/$IG_DATABASE -f createDB
