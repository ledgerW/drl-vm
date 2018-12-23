SET INSTANCE_NAME=drl-workspace-gpu
SET SNAPSHOT_NAME=latest-snap
PWD > pwd.txt
SET /p WD= < pwd.txt
SET "GET_SNAPSHOT=%WD%\snapshot.cmd"
SET "DELETE_DISK=%WD%\del_disk.cmd"
SET "STOP_VM=%WD%\stop_vm.cmd"
SET "DELETE_INSTANCE=%WD%\stop_vm.cmd"

call "%STOP_VM%"

call "%GET_SNAPSHOT%"

call "%DELETE_INSTANCE%"

call "%DELETE_DISK%"
