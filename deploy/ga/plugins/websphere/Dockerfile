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
MAINTAINER Adam King <rak@linux.vnet.ibm.com>

RUN apt-get install -y curl

RUN mkdir -p /tmp/appdata/var/plugins/command/stage

RUN    curl --output /tmp/appdata/var/plugins/command/stage/FileUtils-49.796720.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/FileUtils/FileUtils-49.796720.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/MCWASPlugin-11.150506.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/IBMMiddlewareConfigurationForWebSphere/MCWASPlugin-11.150506.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WAS-Configure-38.810352.zip "http://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WebSphereConfiguration/WAS-Configure-38.810352.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WebSphereLiberty-8.802646.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WebSphereLiberty/WebSphereLiberty-8.802646.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WAS-Deploy-96.805833.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/Websphere/WAS-Deploy-96.805833.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WAS-Install-4.810170.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/websphere-install/WAS-Install-4.810170.zip" \
    && curl --output /tmp/appdata/var/plugins/command/stage/WebSpherePortal-2.706482.zip "https://public.dhe.ibm.com/software/products/UrbanCode/plugins/ibmucd/WebSpherePortal/WebSpherePortal-2.706482.zip"

EXPOSE 8080 8443 7918

CMD ["./bin/server","run"]
