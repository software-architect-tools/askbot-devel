FROM python:2

ENV PYTHONUNBUFFERED 1

ADD . /src/
WORKDIR /src/
RUN pip install -r requirements.txt

RUN python setup.py install

# Fix: No such file or directory: '/src/log/askbot.log'
RUN mkdir -p /src/log/
RUN mkdir -p /src/tmp/

RUN chmod 744 /src/Dockerfile.sh
ENTRYPOINT ["/src/Dockerfile.sh"]
CMD []
