#!/bin/bash

gcloud run deploy tradingflavors --platform managed --region $REGION \
  --image gcr.io/$PROJECT_ID/tradingflavors \
  --add-cloudsql-instances ${PROJECT_ID}:${REGION}:tradingflavors \
  --allow-unauthenticated
