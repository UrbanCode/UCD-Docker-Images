#!/bin/bash
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
#  Script to pubish all the urbancode Docker images                            #
#                                                                              #
#                                                                              #
#  Usage : publishAll.sh			                               #
#                                                                              #
################################################################################

echo "TRAVIS_PULL_REQUEST = $TRAVIS_PULL_REQUEST"
echo "TRAVIS_BRANCH = $TRAVIS_BRANCH"
if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
  docker login -u $dockerhubid -p $dockerhubpw

  while read -r imageName buildContextDirectory imageURL
  do
    echo "process $imageName"

    docker push $imageName
    LATEST=$(echo $imageName |sed "s/:.*/:latest/g")
    docker tag $imageName $LATEST
    docker push $LATEST
  done < "images.txt"

  docker logout
fi

