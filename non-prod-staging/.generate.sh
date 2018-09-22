# Configuration Section
OCP_PROJECT=staging  												# Project to be created in Openshift
OCP_PROJECT_NAMESPACE=$OCP_PROJECT 									# Project Namespace - typically like the OCP_PROJECT
DOCKER_OAUTH=<SERVICE_ACCOUNT>@<PROJECT>.gserviceaccount.com 		# PUSH access service account email, provide to EQ dev to build the ETL
GCP_SERVICE_ACCOUNT_JSON=gcr_key.json
VOLUME_STORAGE_CLASS=mn-ds-vsan01
JENKINS_IMAGE_REPO='<DOCKER_REGISTRY>/jenkins.docker.base'
ROUTE_LABE_EXPOSURE=general
GCP_PROJECT=staging
CHECKOUT_PATH=jenkins-staging
IMAGE_PULL_SECRET=gcr-docker-oauth
# Generate the pull access for service account
sed "s/%OCP_PROJECT%/$OCP_PROJECT/g" ../.template/template-gcr-pull.sh \
|sed "s/%DOCKER_OAUTH%/$DOCKER_OAUTH/g" \
|sed "s/%GCP_SERVICE_ACCOUNT_JSON%/$GCP_SERVICE_ACCOUNT_JSON/g"> gcr-pull.sh
chmod 755 gcr-pull.sh

# Generate the spec for jenkins
sed "s/%OCP_PROJECT_NAMESPACE%/$OCP_PROJECT_NAMESPACE/g" ../.template/template-jenkins-all.yaml \
|sed "s/%VOLUME_STORAGE_CLASS%/$VOLUME_STORAGE_CLASS/g" \
|sed "s/%JENKINS_IMAGE_REPO%/$JENKINS_IMAGE_REPO/g" \
|sed "s/%CHECKOUT_PATH%/$CHECKOUT_PATH/g" \
|sed "s/%IMAGE_PULL_SECRET%/$IMAGE_PULL_SECRET/g" \
|sed "s/%ROUTE_LABE_EXPOSURE%/$ROUTE_LABE_EXPOSURE/g" > jenkins-all.yaml

# Generate deployment script
sed "s/%OCP_PROJECT%/$OCP_PROJECT/g" ../.template/template-deploy.sh > .deploy.sh
chmod 755 .deploy.sh

# Copy the template for gcs service account, require manual update
cp ../.template/template-gcs-push-secret.yaml gcs-push-secret.yaml

# Copy the gcs service account secret create
cp ../.template/template-gcs-push.sh gcs-push.sh
chmod 755 gcs-push.sh

# Copy the delete 
cp ../.template/template-delete.sh .delete.sh
chmod 755 .delete.sh