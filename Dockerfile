FROM bcgovimages/von-image:py36-1.14-1

ARG ISSUER_SEED
ARG ISSUER_AGENT_ENDPOINT
ARG ISSUER_WALLET_KEY
ARG ISSUER_ADMIN_API_KEY
ARG ISSUER_HOSTNAME
ARG GENESIS_URL
ARG INBOUND_PORT
ARG API_PORT

ENV SEED=$ISSUER_SEED
ENV AGENT_ENDPOINT=$ISSUER_AGENT_ENDPOINT
ENV WALLET_KEY=$ISSUER_WALLET_KEY
ENV ADMIN_API_KEY=$ISSUER_ADMIN_API_KEY
ENV GENESIS=$GENESIS_URL
ENV AGENT_INBOUND_PORT=$INBOUND_PORT
ENV ADMIN_API_PORT=$API_PORT

RUN pip install aries-cloudagent

ENTRYPOINT ["/bin/bash", "-c", "aca-py start  --inbound-transport http 0.0.0.0 $AGENT_INBOUND_PORT \
    --outbound-transport http \
    --admin 0.0.0.0 $ADMIN_API_PORT \
    --seed $SEED \
    --endpoint $AGENT_ENDPOINT \
    --wallet-key $WALLET_KEY \
    --wallet-name VaxCertIssuer \
    --wallet-type indy \
    --label CertIssuer \
    --admin-api-key $ADMIN_API_KEY \
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
    --genesis-url $GENESIS", "--"]