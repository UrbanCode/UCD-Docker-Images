## UCD with embedded Derby DB

### Running the docker-compose

```sh

$ docker-compose up -d

```

### Resulting Environment

Running the ```docker-compose up -d``` command creates the following containers
- UCD Server
- UCD Agent
- UCD Agent Relay

These containers are connected in the following way

#### UCD Server to

- Embedded DerbyDB
- Agent
- Agent Relay

#### UCD Agent to

- UCD Server

#### UCD Agent Relay to

- UCD Server

### Accessing the Environment

```sh

Grab the IP of your docker-machine:
$ docker-machine ip

```
#### Web Access

**UCD Server UI:**
https://DOCKER_MACHINE_IP:8443

Username/Password:
admin/admin


##License
**(C) Copyright IBM Corporation 2016.**
**Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0**
**Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.**