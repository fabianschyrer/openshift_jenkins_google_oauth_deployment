# Create secret for gcr pull access to specific environment
oc create secret docker-registry gcr-docker-oauth --docker-server=https://<DOCKER_REGISTRY> \
--docker-username=_json_key \
--docker-password="$(cat %GCP_SERVICE_ACCOUNT_JSON%)" \
--docker-email=%DOCKER_OAUTH%

# Link the gcr access token to 'default' service account
# oc secrets link default gcr-docker-oauth --for=pull

# Add Edit role to jenkins account
# oc policy add-role-to-user edit system:serviceaccount:%OCP_PROJECT%:jenkins