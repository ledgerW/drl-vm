SET DISK_NAME=latest-disk
SET SNAPSHOT_NAME=latest-snap

gcloud compute disks snapshot %DISK_NAME% ^
--snapshot-names=%SNAPSHOT_NAME%
