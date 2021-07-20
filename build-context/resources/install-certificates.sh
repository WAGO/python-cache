#!/bin/bash
curl -ksSL https://artifactory.wago.local/certs-generic-prod/wago-intercept-certificates/cert_SSL-Intercept-2020-PEM.crt -o /usr/local/share/ca-certificates/cert_SSL-Intercept.crt
update-ca-certificates

if [ -f "/usr/local/share/ca-certificates/cert_SSL-Intercept.crt" ]; then
    pip config set --global global.cert /usr/local/share/ca-certificates/cert_SSL-Intercept.crt
    pip config set --global global.extra-index-url https://www.piwheels.org/simple
    git config --global http.sslCAInfo /usr/local/share/ca-certificates/cert_SSL-Intercept.crt
fi
