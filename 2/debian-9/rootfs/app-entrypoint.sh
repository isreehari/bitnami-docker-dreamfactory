#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "httpd" ]]; then
    # SPLessons custom code - start    
    # cd /tmp/bitnami/pkg/spldreamfactory    
    #   nami unpack dfmodifiedproject
    # cd /
    # rm -rf /tmp/bitnami/pkg/spldreamfactory
    # SPLessons custom code - end
  nami_initialize apache php libphp dreamfactory
  info "Starting dreamfactory... "
fi

exec tini -- "$@"
