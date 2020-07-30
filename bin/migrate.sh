#!/bin/bash

gcloud builds submit --config cloudmigrate.yaml     --substitutions _REGION=$REGION
