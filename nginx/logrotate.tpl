/var/log/nginx/*.log {
    daily
    missingok
    rotate {{.RotateDays}}
    compress
    delaycompress
    notifempty
    create 0640 {{.ServiceOwner}} adm
    sharedscripts
    postrotate
        if [ -f /var/run/nginx.pid ]; then
            kill -USR1 `cat /var/run/nginx.pid`
        fi
    endscript
}