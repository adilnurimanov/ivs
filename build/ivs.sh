#!/bin/bash -eu
################################################################
#
#        Copyright 2013, Big Switch Networks, Inc.
#
# Licensed under the Eclipse Public License, Version 1.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#        http://www.eclipse.org/legal/epl-v10.html
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the
# License.
#
################################################################

ROOT=$(dirname $(readlink -f $0))/..
TOOLCHAIN=${TOOLCHAIN:=gcc-local}
sudo "$ROOT/build/veth_setup.sh"
export INDIGO_BENCHMARK=1 # disable ratelimiters
sudo -E ${TOOL:-} "$ROOT/targets/ivs/build/$TOOLCHAIN/bin/ivs" \
    -i veth0 -i veth2 -i veth4 -i veth6 -i veth8 -i veth10 -i veth12 -i veth14 \
    -c 127.0.0.1 -l 127.0.0.1:6634 "$@"
