#!/usr/bin/env bash

CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

cd $CDIR
rm -rf $build_dir && mkdir -p $build_dir

for f in *prerun.sh home
do
    cp -r $CDIR/$f $build_dir/
done

if [ -x "$(command -v pip)" ]; then
  PYTHONUSERBASE=$build_dir/home/.local pip install --user -I -r pip-requirements.txt
else
  echo 'Skip pip packages installation: pip not found.'
fi