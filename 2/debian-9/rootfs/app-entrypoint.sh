#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "httpd" ]]; then
    # SPLessons custom code - start
      if [ -d "spldreamfactory"]; then 
            cd spldreamfactory    
            if [ -d "dfmodifieddocker"]; then 
                nami unpack dfmodifieddocker
            fi
            cd /
            rm -rf spldreamfactory       
      fi
    # SPLessons custom code - end
  nami_initialize apache php libphp dreamfactory
  info "Starting dreamfactory... "
fi

exec tini -- "$@"
