function setgopath() {
  if [ -n "$1" ] ; then
    echo 'Usage: setgopath' 1>&2
    echo 'Sets GOPATH to the current directory, if it looks like a Go workspace.' 1>&1
    return
  fi
  if [ ! -d src ] ; then
    echo 'There is no src/ subdir here, is this a Go workspace?' 1>&2
    return
  fi
  export GOPATH=$(pwd)
  echo "GOPATH=$GOPATH is now set"
}
alias gopath=setgopath
