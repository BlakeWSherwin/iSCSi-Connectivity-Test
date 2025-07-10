The iSCSi-Test script simply checks for a created test file stored on your clustered storage which in my case was located at "C:\ClusterStorage\Volume1\downtest.txt"

If the file exists no action is taken, however if the file does not exist it generates an email stating that the iSCSi connection is down. The file is only accessible while iSCSi is connected to your storage, so this test will effectively confirm the iSCSi status. 

My use case: In my case we were in the midst of migrating away from a failing Hyper-V cluster to a new clustered VMware environment. We would often lose connection to cluster nodes and to the Nimble storage which would result in paused virtual servers. 

Setting this script to run as a scheduled task in a 1 minute interval would allow us to begin taking action BEFORE the calls started flooding in, effectively speeding up resolution when this would occur. 