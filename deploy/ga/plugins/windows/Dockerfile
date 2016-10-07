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

RUN    curl --output /tmp/appdata/var/plugins/command/stage/WindowsFailoverCluster-4.641674.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WindowsFailoverClusters/WindowsFailoverCluster-4.641674.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/ServiceControlManager-8.423610.zip  "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/ServiceControlManager/ServiceControlManager-8.423610.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WindowsSystemTools-21.804846.zip  "http://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WindowsSystemTools/WindowsSystemTools-21.804846.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WinRSAgentInstall-6.786202.zip  "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WinRSAgentInstall/WinRSAgentInstall-6.786202.zip"

EXPOSE 8080 8443 7918

CMD ["./bin/server","run"]
