#!/bin/sh

default()
{
  BUILD_DIR=$TRAVIS_BUILD_DIR
  cd $BUILD_DIR
  cp -r ./src ./dist
}


# main()
{
  default
}
