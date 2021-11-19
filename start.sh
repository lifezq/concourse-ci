docker-compose up -d

fly -t tutorial set-pipeline -p hello-world -c hello-world.yml
fly -t tutorial unpause-pipeline -p hello-world
fly -t tutorial trigger-job --job hello-world/hello-world-job --watch

fly -t tutorial set-pipeline -p job-interval-at-12-17 -c trigger-on-an-interval-within-time-range.yaml
fly -t tutorial unpause-pipeline -p job-interval-at-12-17
fly -t tutorial trigger-job --job job-interval-at-12-17/something-every-5m-during-midnight-hour --watch

fly -t tutorial set-pipeline -p repo-pipeline -c repo-pipeline.yml --load-vars-from vars.yaml
fly -t tutorial unpause-pipeline -p repo-pipeline
fly -t tutorial trigger-job --job repo-pipeline/job-repo-pipeline --watch
fly -t tutorial check-resource -r repo-pipeline/private-repo

fly -t tutorial set-pipeline -p s3-pipeline -c minio-object.yaml
fly -t tutorial unpause-pipeline -p s3-pipeline
fly -t tutorial trigger-job --job s3-pipeline/job-minio-s3-object --watch
fly -t tutorial check-resource -r s3-pipeline/s3-resource

fly -t tutorial execute --config unit-tests.yaml --input inputA=. --output output1=/tmp/output1
