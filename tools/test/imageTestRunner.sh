#!/bin/sh
# (C) Copyright IBM Corporation 2016.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
startContainer () {
    echo "Starting a container from the image $IMAGE$VERSION"
    CONTAINER_ID=$(docker run -dt $IMAGE$VERSION)
    if [ -z $CONTAINER_ID ]; then
        echo "ERROR: Could not start a container from the image $IMAGE$VERSION"
        exit 1
    fi
    echo "Created Container: $CONTAINER_ID"
}

stopContainer () {
    echo "Stopping Container: $CONTAINER_ID"
    docker stop $CONTAINER_ID &> /dev/null
    docker rm $CONTAINER_ID &> /dev/null
}

#Parse args
while [ $# -gt 1 ]
do
    key="$1"

    case $key in
        -i|--image)
        IMAGE="$2"
        shift # past argument
        ;;
        -t|--tag)
        VERSION="$2"
        shift # past argument
        ;;
        -s|--search)
        SEARCH="$2"
        shift # past argument
        ;;
        --default)
        DEFAULT=YES
        ;;
        *)
            # unknown option
        ;;
    esac
    shift # past argument or value
done

#Read the args
#IMAGE="$1"
if [ -z $IMAGE ]; then
    echo "Usage: ./testUCDContainer.sh -i IMAGE_NAME [-t IMAGE_TAG] [-s SEARCH_PROCESS]"
    exit 1;
fi

if [ -n $VERSION ]; then
    VERSION=":$VERSION"
fi

if [ -z $SEARCH ]; then
    SEARCH="ibm-ucd"
fi


EXIT_STATUS=0

#Start the container
startContainer

#Wait for the container to start up
sleep 2

echo "Testing if process is running"
#Test if a UCD product is running
CONTAINER_RUNNING=$(docker exec $CONTAINER_ID ps -ef | grep "$SEARCH" | grep -v grep)
EXEC_STATUS=$?


if [ -z "$CONTAINER_RUNNING" ]; then
    echo "Container from image $IMAGE$VERSION did not start up correctly"
    EXIT_STATUS=1
fi

#If things didn't go well with the container, exit with an error
if [ $EXEC_STATUS != 0 ]; then
    echo "Container from image $IMAGE$VERSION did not start correctly"
    EXIT_STATUS=2
fi

#Stop the container
stopContainer

if [ $EXIT_STATUS = 0 ]; then
    echo "Test passed"
else
    echo "Test failed"
fi

echo "Finished, exiting"
exit $EXIT_STATUS