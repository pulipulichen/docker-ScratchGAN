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

#RUN bash ./curlData.sh
#RUN curl https://storage.googleapis.com/deepmind-scratchgan-data/train.json --output /tmp/emnlp2017/input.example/train.json
#RUN curl https://storage.googleapis.com/deepmind-scratchgan-data/valid.json --output /tmp/emnlp2017/input.example/valid.json
#RUN curl https://storage.googleapis.com/deepmind-scratchgan-data/test.json --output /tmp/emnlp2017/input.example/test.json
#RUN curl https://storage.googleapis.com/deepmind-scratchgan-data/glove_emnlp2017.txt --output /tmp/emnlp2017/input.example/glove_emnlp2017.txt

RUN /usr/local/bin/python -m pip install --upgrade pip
#RUN pip install --upgrade pip

RUN set -e
RUN python3.5 -m venv scratchgan-venv

RUN echo 'Created venv'
RUN . /tmp/emnlp2017/scratchgan/scratchgan-venv/bin/activate

RUN echo 'Getting requirements.'
RUN pip install absl-py==0.7.1
RUN pip install numpy==1.16.4
RUN pip install tensorflow==1.15
RUN pip install tensorflow-probability==0.7.0
RUN pip install tensorflow-gan==1.0.0.dev0
RUN pip install tensorflow-hub==0.6.0
RUN pip install tensorflow-io==0.8.0
RUN pip install tensorflow-gpu==1.15
RUN pip install dm-sonnet==1.34

#RUN bash ./setup.sh

WORKDIR /tmp/emnlp2017/

CMD ["bash", "./scratchgan/train.sh"]