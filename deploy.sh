#!/bin/sh

set +e

gcloud functions deploy cf-prod-mongodb-monitoring \
    --entry-point=F \
    --memory=128MB \
    --region=asia-northeast3 \
    --runtime=go113 \
    --env-vars-file=env.yaml \
    --trigger-http \
    --timeout=10s \
    --service-account=[SERVICE_ACCOUNT]