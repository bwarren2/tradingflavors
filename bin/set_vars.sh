#!/bin/bash
export PROJECT_ID=$(gcloud config get-value core/project)
export REGION=us-central1
export PROJECTNUM=$(gcloud projects describe ${PROJECT_ID} --format 'value(projectNumber)')
export CLOUDRUN=${PROJECTNUM}-compute@developer.gserviceaccount.com
export CLOUDBUILD=${PROJECTNUM}@cloudbuild.gserviceaccount.com
