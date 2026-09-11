#!/bin/bash

# ============================================================
# SELinux Permanent File Context Assignment
# ============================================================

set -u

echo "=========================================="
echo " SELinux Permanent File Context Assignment"
echo "=========================================="

# 1. Create the directory /webdata/files
sudo mkdir -p /webdata/files

# 2. Create the file /webdata/files/index.html
sudo touch /webdata/files/index.html

# 3. Display the current SELinux context
# of /webdata and index.html
ls -Zd /webdata
ls -Z /webdata/files/index.html

# 4. Add a permanent SELinux file-context rule
sudo semanage fcontext -a -t httpd_sys_content_t '/webdata(/.*)?'

# 5. Apply the permanent SELinux rule recursively
sudo restorecon -Rv /webdata

# 6. Verify the final SELinux contexts
ls -Zd /webdata
ls -Z /webdata/files/index.html

echo "=========================================="
echo " Assignment completed"
echo "=========================================="

exit 0
