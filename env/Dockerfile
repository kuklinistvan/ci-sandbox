FROM docker.io/library/almalinux:9.1

COPY setup/system/enable_repos.sh /setup/system/enable_repos.sh
RUN /setup/system/enable_repos.sh

COPY setup/system/install_packages.sh /setup/system/install_packages.sh
RUN /setup/system/install_packages.sh

#COPY setup/system/setup_cron_mlocate.sh /setup/system/setup_cron_mlocate.sh
#RUN /setup/system/setup_cron_mlocate.sh

COPY setup/system/setup_mock_accounts.sh /setup/system/setup_mock_accounts.sh
RUN /setup/system/setup_mock_accounts.sh

COPY setup/user/setup_rpmbuild_tree.sh /setup/user/setup_rpmbuild_tree.sh
RUN /setup/user/setup_rpmbuild_tree.sh

COPY setup/user/try_remove_aliases_from_rcs.sh /setup/user/try_remove_aliases_from_rcs.sh
RUN /setup/user/try_remove_aliases_from_rcs.sh

COPY setup/user/setup_git.sh /setup/user/setup_git.sh
RUN /setup/user/setup_git.sh

RUN dnf install --assumeyes sudo
COPY sudoers /etc/sudoers

RUN dnf install --assumeyes podman-docker
RUN dnf install --assumeyes wget
