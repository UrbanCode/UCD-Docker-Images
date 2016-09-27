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
MAINTAINER Shrenik Shah <ssshah@us.ibm.com>

RUN apk add --update curl

#Copy the files to tmp folder
ADD ./common /tmp/

ARG ucdInstallImageUrl

# Specify <userid>:<password> or PasswordIsAuthToken:<your AHP Token>

#Install UCD to this directory
ARG AGENT_HOME=/opt/ibm-ucd/agent

RUN /bin/sh /tmp/agent-setup.sh

# Set work directory for/and command
WORKDIR /tmp
CMD ["sh", "startAgent.sh"]

LABEL copyright="(c) Copyright IBM Corporation 2016. All Rights Reserved."
