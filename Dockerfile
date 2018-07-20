# This is go
FROM golang

# Add all that is in this subdir
ADD . .

# For debugging paths:
#  RUN pwd
#  RUN ls -lR /go
# $GOPATH in the docker is always /go, so:
# - you must have /go/src/<whatever>
# - you will get  /go/bin/<whatever>

# Make the helloserver
RUN go install helloserver

# Binary to run
ENTRYPOINT /go/bin/helloserver

# Port to expose
EXPOSE 8080
