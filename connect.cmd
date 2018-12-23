SET INSTANCE_NAME=drl-workspace-gpu
gcloud compute ssh %INSTANCE_NAME% -- -L 8888:localhost:8888
