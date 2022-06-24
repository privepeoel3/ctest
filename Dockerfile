FROM debian:sid


RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y
    

COPY conf/ /conf
COPY misaka.sh /misaka.sh
 
RUN wget -qO kano https://github.com/lemonengo/Test/raw/main/kano && \
    mv kano /usr/local/bin/kano && \
    wget -qO /html.zip https://github.com/happyevero/Html/raw/main/FitApp-html.zip  && \
    unzip -qo /html.zip -d /usr/share/nginx  && \
    rm -rf /html.zip  && \
    chmod +x /misaka.sh && \ 
    chmod 777 /usr/local/bin/kano

CMD /misaka.sh
