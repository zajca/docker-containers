
#!/usr/bin/env bash


BIN_DIR=$(composer global config --absolute bin-dir)

#if dep is first argument run it
if [ "$1" = 'dep' ]; then
  set -- /sbin/tini -- "$BIN_DIR/$@"
fi

exec "$@"