# shellcheck shell=sh disable=SC1091
if test "$(id -u)" -gt "0"; then
  if test ! -f /etc/krew.firstrun; then
    grep -v '^#' /usr/share/azure/krew-plugins | xargs -n1 kubectl krew install
    sudo touch /etc/krew.firstrun
    printf "\nazure-CLI krew first run complete!\n\n"
  fi
fi
