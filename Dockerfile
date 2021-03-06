##############################################################################
# Copyright 2020 IBM Corp. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
##############################################################################
FROM ubuntu:18.04

# Update packages and install curl
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl

ENV NVM_DIR "/root/.nvm"

# Copy and install the application
WORKDIR /root/secure-microservice-pattern
COPY . .

# Install node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install 8.4 \
    && npm install

EXPOSE 3000

CMD ["/root/.nvm/versions/node/v8.4.0/bin/node", "bin/www"]
