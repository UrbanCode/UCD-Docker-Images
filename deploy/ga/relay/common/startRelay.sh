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
FILE_NAME="/opt/ibm/agentrelay/conf/agentrelay.properties"

sed_file () {
    PROP_NAME=$1
    PROP_VALUE=$2
    sed -i "s@$PROP_NAME=[^ ]*@$PROP_NAME=$PROP_VALUE@g" "$FILE_NAME"
}

# Check if $RELAY_HOST is reachable. If not, use 127.0.0.1.
pingRc=0
ping -c1 $RELAY_HOST 2>&1 >/dev/null
pingRc=$?

if [ "$pingRc" -ne "0" ] ; then
    RELAY_HOST=127.0.0.1
fi

sed_file "agentrelay.jms_proxy.name" relay-$HOSTNAME
sed_file "agentrelay.codestation.server_url" $SERVER_URL
sed_file "agentrelay.jms_proxy.servers" $PROXY_SERVERS
sed_file "agentrelay.install.service.password" $AUTH_TOKEN
sed_file "agentrelay.http_proxy.host" $RELAY_HOST
sed_file "agentrelay.jms_proxy.relay_host" $RELAY_HOST

./bin/agentrelay run
