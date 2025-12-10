#!/bin/bash
nume_host = $2
ip_arg = $3
        ip_nslookup=$(nslookup "$nume_host" 2>/dev/null | grep -A 1 'Name:' | grep 'Address:' | awk '{print $2}' | tail -n 1)
        if [[ -n "$ip_nslookup" ]] && [[ "$ip_arg" != "$ip_nslookup" ]]; then
            echo "Bogus IP for $nume_host in /etc/hosts! Config: $ip_arg, Resolved: $ip_nslookup"
        fi