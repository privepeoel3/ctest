#!/bin/sh

sed -e "/^#/d"\
    -e "s/\${UUID}/${UUID}/g"\
    -e "s/\${TYPE}/${TYPE}/g"\
    /conf/Xray.template.json >  /Xlano.json
echo /xraybin/config.json
cat /xraybin/config.json


sed -e "/^#/d"\
    -e "s/\${PORT}/${PORT}/g"\
    -e "s/\${UUID}/${UUID}/g"\
    -e "s/\${TYPE}/${TYPE}/g"\
    -e "$s"\
    /conf/nginx.template.conf > /etc/nginx/conf.d/ray.conf
echo /etc/nginx/conf.d/ray.conf
cat /etc/nginx/conf.d/ray.conf

/usr/local/bin/kano -config=/Xlano.json  &
rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
