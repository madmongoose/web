FROM opensuse/leap

RUN zypper update -y && zypper install -y vim wget python python3 python-pip python3-pip
RUN pip install flask

RUN mkdir /www
COPY .megacorp /www
WORKDIR /www/megacorp

CMD python3 -m http.server 80

EXPOSE 80
