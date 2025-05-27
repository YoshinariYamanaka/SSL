endpoint='aws.amazon.com'
openssl s_client -connect ${endpoint}:443 -showcerts >endpoint.pem 2>&1 </dev/null

# openssl x509 -noout -text -in endpoint.pem >x509
awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/' endpoint.pem | \
while openssl x509 -noout -text 2>/dev/null; do :; done >>x509
