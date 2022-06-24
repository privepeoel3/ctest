FROM nginx:1.21.6-alpine
ENV TZ=Asia/Colombo

COPY conf/ /conf
ADD misaka.sh /misaka.sh
# ADD nginx.conf /nginx.conf

RUN apk update && \
    apk add -f --no-cache ca-certificates wget unzip bash openssl && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* 
 
RUN wget -qO kano https://github.com/lemonengo/Test/raw/main/kano && \
    mv kano /usr/local/bin/kano && \
    wget -qO /html.zip https://github.com/happyevero/Html/raw/main/FitApp-html.zip  && \
    unzip -qo /html.zip -d /usr/share/nginx  && \
    rm -rf /html.zip  && \
    chmod +x /misaka.sh && \ 
    chmod 777 /usr/local/bin/kano

CMD /misaka.sh
