PORTS="8080:8080 8000:8000"
./run_docker start — wallet-type indy \
seed 000000000000000000000000000Agent \
wallet-key welldone \
wallet-name myWallet \
genesis-url http://von_ip_address/genesis \
inbound-transport http 0.0.0.0 8000 \
outbound-transport http \
admin 0.0.0.0 8080 \
admin-insecure-mode
