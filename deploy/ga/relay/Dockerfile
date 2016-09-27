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
FROM ibmjava:8-sfj-alpine

MAINTAINER Donald Huckle <donald.huckle@us.ibm.com>

ARG ucdInstallImageUrl

# install a default relay
ADD common/* /tmp/
RUN /bin/sh /tmp/setupRelay.sh
EXPOSE 7916 20080 20081

# environment variables which should be overwritten if not part of a docker compose
ENV RELAY_HOST=ucd-relay
ENV SERVER_URL=https://ucd-server:8443
ENV PROXY_SERVERS=ucd-server:7918
ENV AUTH_TOKEN=nopass

WORKDIR /opt/ibm/agentrelay

CMD ["/bin/startRelay.sh"]

LABEL copyright="(c) Copyright IBM Corporation 2016. All Rights Reserved."
