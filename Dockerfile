FROM bcgovimages/von-image:py36-1.14-1

RUN pip install aries-cloudagent

ENTRYPOINT ["/bin/bash", "-c", "aca-py start  --inbound-transport http 0.0.0.0 8000 \
    --outbound-transport http \
    --admin 0.0.0.0 3000 \
    --seed 000000000000000000000000Trustee1 \
    --wallet-key Xaff17iH1MNc \
    --wallet-name VaxCertIssuer \
    --wallet-type indy \
    --label CertIssuer \
    --admin-api-key secret \
    --auto-accept-invites \
    --auto-accept-requests \
    --auto-respond-messages \
    --auto-respond-credential-proposal \
    --auto-respond-credential-offer \
    --auto-respond-credential-request \
    --auto-respond-presentation-proposal \
    --auto-respond-presentation-request \
    --auto-store-credential \
    --enable-undelivered-queue \
    --genesis-url http://vonx.pocquebec.org:9000/genesis", "--"]