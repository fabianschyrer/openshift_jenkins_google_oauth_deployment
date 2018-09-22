# oc new-project <PROJECT_NAME> --description="<DESCRIPTION>" --display-name="<DISPLAY_NAME>"
# oc project <PROJECT_NAME>

#Create service account for gcr-pull and place the service account to push ETL data to GCS
chmod 755 gcr-pull.sh gcs-push.sh
./gcr-pull.sh
./gcs-push.sh

#Create Jenkins for scheduling the ETL
oc create -f jenkins-all.yaml
# oc create -f nginx-all.yaml
