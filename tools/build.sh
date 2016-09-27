#! /bin/bash
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
################################################################################
#                                                                              #
#  Script to build a docker image                                              #
#                                                                              #
#                                                                              #
#  Usage : build.sh <Image name> <Dockerfile location>                         #
#                                                                              #
################################################################################

image=$1
dloc=$2
url=$3
logname=$(echo $image | sed s/:/-/g)

if [ $# -lt 2 ]
then
   if [ $# != 1 ]
   then
      echo "Usage : build.sh <Image name> <Dockerfile location> [--build-arg <Build arg value>]"
      exit 1
   else
      echo "Dockerfile location not provided, using ."
      dloc="."
   fi
fi

echo "*************************************************************************"
echo "           Starting docker build for $image                              "
echo

docker build --no-cache=true -t $image $url $dloc > logs/build_$logname.log

if [ $? = 0 ]
then
    echo "              $image built successfully                              "
    echo "*********************************************************************"
else
    echo " Build failed , exiting.........."
    exit 1
fi
