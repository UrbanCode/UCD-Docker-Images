#Test Scripts for urban{code} docker images

These scripts test if the processes are running inside the UrbanCode docker containers

To run:
 `./testScriptName.sh DOCKER_IMAGE_TAG`
If no **DOCKER_IMAGE_TAG** is provided **latest** will be used


Each script depends on **imageTestRunner.sh**
To run imageTestRunner.sh directly do:
 `./imageTestRunner.sh -i DOCKER_IMAGE_NAME [-t DOCKER_IMAGE_TAG] [-s PROCESS_SEARCH_TERM]`
Where **PROCESS_SEARCH_TERM** defaults to **ibm_ucd**


##License
**(C) Copyright IBM Corporation 2016.**
**Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0**
**Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.**