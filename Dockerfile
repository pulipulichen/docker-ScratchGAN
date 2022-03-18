#Specify the version of nodejs.
FROM python:3.5.6

RUN useradd -m user
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
      apt-get install -y \
      git curl 

#Creating an application directory
RUN mkdir -p /tmp/emnlp2017/input
RUN mkdir -p /tmp/emnlp2017/input.example
RUN mkdir -p /tmp/emnlp2017/output
RUN mkdir -p /tmp/emnlp2017/scratchgan
#Use app directory as development directory
WORKDIR /tmp/emnlp2017/scratchgan

COPY ./scratchgan /tmp/emnlp2017/scratchgan

RUN bash ./setup.sh

CMD ["bash", "./train.sh"]