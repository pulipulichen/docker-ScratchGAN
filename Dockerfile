#Specify the version of nodejs.
#FROM python:3.5.6
FROM dayyass/muse_as_service:1.1.2

# =====================
RUN echo 'Getting requirements.'

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install absl-py==0.7.1
RUN pip install numpy==1.16.4
#RUN pip install tensorflow==1.15
RUN pip install tensorflow-probability==0.7.0
RUN pip install tensorflow-gan==1.0.0.dev0
#RUN pip install tensorflow-hub==0.6.0
#RUN pip install tensorflow-io==0.8.0
RUN pip install tensorflow-gpu==1.15
#RUN pip install tensorflow-text==2.3.0
RUN pip install dm-sonnet==1.34

# ====================
RUN useradd -m user
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
      apt-get install -y \
      git curl nano

# ====================
#Creating an application directory

RUN mkdir -p /tmp/emnlp2017/input
RUN mkdir -p /tmp/emnlp2017/input.example
RUN mkdir -p /tmp/emnlp2017/output
RUN mkdir -p /tmp/emnlp2017/scratchgan

COPY ./scratchgan /tmp/emnlp2017/scratchgan
