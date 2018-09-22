# Create secret for gcr pull access to specific environment
oc create secret docker-registry gcr-docker-oauth --docker-server=https://<DOCKER_REGISTRY> \
--docker-username=_json_key \
--docker-password="$(cat gcr_key.json)" \
--docker-email=<SERVICE_ACCOUNT>@<PROJECT>.iam.gserviceaccount.com

# Link the gcr access token to 'default' service account
# oc secrets link default gcr-docker-oauth --for=pull

# Add Edit role to jenkins account
# oc policy add-role-to-user edit system:serviceaccount:dev:jenkins
