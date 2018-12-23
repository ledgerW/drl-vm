SET IMAGE_FAMILY=pytorch-latest-cpu
SET ZONE=us-west1-b
SET INSTANCE_NAME=drl-workspace-cpu
SET INSTANCE_TYPE=n1-standard-8

gcloud compute instances create %INSTANCE_NAME% ^
 --zone=%ZONE% ^
 --image-family=%IMAGE_FAMILY% ^
 --image-project=deeplearning-platform-release
