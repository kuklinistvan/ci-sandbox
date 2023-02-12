#!/bin/bash

set -ex

wget "https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/37/Everything/source/tree/Packages/c/capstone-4.0.2-10.fc37.src.rpm" -O ~/rpmbuild/SRPMS/capstone-4.0.2-10.fc37.src.rpm

rpmbuild --nocheck --rebuild ~/rpmbuild/SRPMS/capstone-4.0.2-10.fc37.src.rpm
