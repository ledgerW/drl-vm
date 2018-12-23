SET IMAGE_FAMILY=ubuntu-1804-lts
SET ZONE=us-west1-b
SET INSTANCE_NAME=drl-workspace-gpu
SET INSTANCE_TYPE=n1-standard-8

gcloud compute instances create %INSTANCE_NAME% ^
--zone=%ZONE% ^
--image-family=%IMAGE_FAMILY% ^
--image-project=ubuntu-os-cloud ^
--maintenance-policy=TERMINATE ^
--accelerator="type=nvidia-tesla-v100,count=1" ^
--machine-type=%INSTANCE_TYPE% ^
--boot-disk-size=400GB ^
--metadata="install-nvidia-driver=True"
