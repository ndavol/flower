#!/bin/bash

# Copyright 2020 Adap GmbH. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

set -e
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/../

GRPC_SERVER_ADDRESS="[::]"
GRPC_SERVER_PORT=8080

# Start five clients
python -m flower_examples.tf_cifar.client --cid=0 --partition=0 --clients=5 --grpc_server_address=$GRPC_SERVER_ADDRESS --grpc_server_port=$GRPC_SERVER_PORT &
python -m flower_examples.tf_cifar.client --cid=1 --partition=1 --clients=5 --grpc_server_address=$GRPC_SERVER_ADDRESS --grpc_server_port=$GRPC_SERVER_PORT &
python -m flower_examples.tf_cifar.client --cid=2 --partition=2 --clients=5 --grpc_server_address=$GRPC_SERVER_ADDRESS --grpc_server_port=$GRPC_SERVER_PORT &
python -m flower_examples.tf_cifar.client --cid=3 --partition=3 --clients=5 --grpc_server_address=$GRPC_SERVER_ADDRESS --grpc_server_port=$GRPC_SERVER_PORT &
python -m flower_examples.tf_cifar.client --cid=4 --partition=4 --clients=5 --grpc_server_address=$GRPC_SERVER_ADDRESS --grpc_server_port=$GRPC_SERVER_PORT &
echo "Started five clients"
