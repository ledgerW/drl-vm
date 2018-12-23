SET DISK_NAME=latest-disk
SET SNAPSHOT_NAME=latest-snap

gcloud compute disks create %DISK_NAME% ^
--source-snapshot %SNAPSHOT_NAME%
