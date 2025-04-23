#!/bin/bash
ROUTE_FILE="/etc/my_static_routes.conf"

/usr/bin/logger "[ROUTE] Re-applying static routes from $ROUTE_FILE"

if [[ -f "$ROUTE_FILE" ]]; then
    while read route; do
        /usr/sbin/ip route add $route
    done < "$ROUTE_FILE"
fi
