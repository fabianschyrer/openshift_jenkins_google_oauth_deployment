# README #

The acm-dp-openshift-deployment is a placeholder for TMN openshift deployment as a main scheduler for Dataplatform ETL application.

## How do I get set up? ##

There are 2 main files that will generate/remove all content for each environment </br>
1) .generate_all.sh </br>
2) .cleanup.sh </br>

There are at least 2 service account required

1. gcr_key.json - specified the authorization to proper GCR, so that OCP can pull the Jenkins image from specific GCR location
2. gcr-push-secret.yaml - copy the 'content' of service account that ETL will use to push the result from database to gcs. (please note that the yaml must be properly indented)


### Generate all resourece ###
`./.generate_all.sh`

The shell will simply generate the environment
*Please note that there is a authorized key file that need to be in place and naming as 'gcr_key.json'*

1. jenkins-all.yaml - The Jenkins YAML spec
2. gcr-pull.sh - GCR pull access script, which required 'manual', this is to ensure the job permission on the permissible GCS bucket
3. deploy.sh - the script for deployment


### Cleanup all resourece ###
`./.cleanup_all.sh`

Cleans up the generated files


## How to add a new environment for ETL ##

1. Create new folder with naming convention as [Project]-[countrycode]-[non-prod|prod]-[environment]
2. Copy the env.config file from any existing folder to new folder
3. Update the env.config to fit the environment
4. Execute the .generate_all.sh to generate all required scripts for the environment