#!/bin/bash

mkdir -p /log
log_file="/log/app.log"

function echo_log {
  DATE='date +%Y/%m/%d:%H:%M:%S'
  echo `$DATE`" $1"
  echo `$DATE`" $1" >> $log_file
}

function start_app {
  echo_log ""
  
  if [ -n "$BEFORE_STARTUP_COMMAND" ]; then
    echo_log "You supplied a command to execute before server normal start: $BEFORE_STARTUP_COMMAND"
    echo_log "############################ "
    echo_log "Custom command"
    python -W ignore ./manage.py "$BEFORE_STARTUP_COMMAND" --noinput
  fi  
  
  echo_log "############################ "
  echo_log "Starting app"

  python -W ignore ./manage.py "runserver" "0.0.0.0:$PORT"

}

########################
# Scripts starts here
########################

start_app
