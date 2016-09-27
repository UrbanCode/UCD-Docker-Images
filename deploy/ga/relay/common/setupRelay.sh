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
#
# Install an agent-relay
# ucdInstallImageUrl= The URL of the install image zip file, or null if your build has already placed it in /tmp
# credentials= The userid:password needed to download $ucdInstallImageUrl, or null if none needed.

if [ -z "$ucdInstallImageUrl"  ]; then
    echo "No UCD install image URL specified. Looking in /tmp for install image."
else
    echo "UCD install image URL specified. Downloading image from " $ucdInstallImageUrl
    echo "Credentials == " $credentials
    rm -f /tmp/agent-relay*.zip #Clean up any install images that may have been copied in at build time.

    apk add --update curl
    echo running curl --insecure --output /tmp/agent-relay.zip "$ucdInstallImageUrl"
    curl --insecure --output /tmp/agent-relay.zip "$ucdInstallImageUrl"
    apk del curl
fi

# unzip install image
if ls /tmp/agent-relay*.zip 1> /dev/null 2>&1; then
    echo unzip -q /tmp/agent-relay*.zip -d /tmp
    unzip -q /tmp/agent-relay*.zip -d /tmp
    rm /tmp/agent-relay*.zip
else
    echo "No install image found. /tmp/agent-relay*.zip"
    exit 1
fi

# set install properties and install the relay (these can also be specified at runtime)
cat /tmp/supplemental-install.properties >>/tmp/agent-relay-install/install.properties
echo "" >>/tmp/agent-relay-install/install.properties
cd /tmp/agent-relay-install/

# Add a temporary mapping between ucd-server and 127.0.0.1 in /etc/hosts file for relay installation purpose.
echo >>/etc/hosts
echo "127.0.0.1   ucd-server" >>/etc/hosts
./install-silent.sh install.properties
sed '/ucd-server/d' /etc/hosts

# Copy the properties bootstrapper this is called instead of the agentrelay
# script so that we can modify the properties at startup instead of having an
# external file for the agentrelay.properties
cp /tmp/startRelay.sh /bin/startRelay.sh

# Clean up temporary install files
rm -rf /tmp/agent-relay-install
rm -rf /tmp/*
