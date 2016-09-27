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

#Removing the lines from the file
sed -i '/agent.id/d' /opt/ibm-ucd/agent/conf/agent/installed.properties
sed -i '/agent.name/d' /opt/ibm-ucd/agent/conf/agent/installed.properties

#Setting agent.name to "agent-<hostname_of_container>"
#Setting the agent.id to "" so that id is auto generated during start
echo "locked/agent.name=agent-"$HOSTNAME >> /opt/ibm-ucd/agent/conf/agent/installed.properties
echo "locked/agent.id=" >> /opt/ibm-ucd/agent/conf/agent/installed.properties

echo "Starting the agent now"
/opt/ibm-ucd/agent/bin/agent run
