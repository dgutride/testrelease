#!/bin/sh

default()
{
  BUILD_DIR=$TRAVIS_BUILD_DIR
  BOWER_JSON=$BUILD_DIR/bower.json
  cd $BUILD_DIR
  BOWER_VERSION='3.5.3'
  VERSION='3.5.4'
  sed "s|\"version\":.*|\"version\": \"$VERSION\",|" $BOWER_JSON > $BOWER_JSON.tmp

  check $? "Version bump failure"

  if [ -s "$BOWER_JSON.tmp" ]; then
    mv $BOWER_JSON.tmp $BOWER_JSON
    check $? "File move failure"
  fi
}

# Check errors
#
# $1: Exit status
# $2: Error message
# $3: Show warning
check()
{
  if [ "$1" != 0 ]; then
    if [ "$3" = "warn" ]; then
      printf "\n"
      echo "*** Warning: $2"
    else
      printf "\n"
      echo "*** Error: $2"
      exit $1
    fi
  fi
}

# main()
{
  default
}
