SET INSTANCE_NAME=drl-workspace-gpu
SET DISK_NAME=latest-disk
SET SNAPSHOT_NAME=latest-snap
PWD > pwd.txt
SET /p WD= < pwd.txt
SET "CREATE_DISK=%WD%\disk.cmd"
SET "DELETE_SNAPSHOT=%WD%\del_snapshot.cmd"

call "%CREATE_DISK%"

call "%DELETE_SNAPSHOT%"

gcloud compute instances create %INSTANCE_NAME% ^
--disk name=%DISK_NAME%,boot=yes
