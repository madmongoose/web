FROM opensuse/leap

RUN zypper update -y && zypper install -y python3 python3-pip
RUN pip install flask

RUN mkdir /www
COPY megacorp /www/megacorp
WORKDIR /www/megacorp

CMD python3 -m http.server 80

EXPOSE 80
