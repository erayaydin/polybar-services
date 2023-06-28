#!/usr/bin/env bash

selected=$(systemctl list-unit-files --no-pager --type=service --no-legend | dmenu | awk '{print $1;}')

selected=$(echo $selected | awk '{print $1;}')

if [ x$selected != x ] ; then

    action=$(echo -e "start\nstop\nrestart" | dmenu)
    
    case "$action" in
        "start")
            sudo systemctl start $selected
            ;;
        "stop")
            sudo systemctl stop $selected
            ;;
        "restart")
            sudo systemctl restart $selected
            ;;
        "")
            exec $0 "$@"
            ;;
    esac

fi
