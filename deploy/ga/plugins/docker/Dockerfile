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

FROM ibmcom/ucds
MAINTAINER Jenny Yang <yangjenn@us.ibm.com>

RUN apt-get install -y curl

RUN mkdir -p /tmp/appdata/var/plugins/command/stage

RUN    curl --output /tmp/appdata/var/plugins/command/stage/docker-compose-12.796498.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/docker-compose/docker-compose-12.796498.zip" \ 
    && curl --output /tmp/appdata/var/plugins/command/stage/DockerSourceConfig-6.809844.zip  "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/DockerSourceConfig/DockerSourceConfig-6.809844.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/docker-plugin-3.780462.zip  "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/docker-plugin/docker-plugin-3.780462.zip" 

EXPOSE 8080 8443 7918

CMD ["./bin/server","run"]
