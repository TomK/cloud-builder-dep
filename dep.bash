#!/bin/bash
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# create gopath and symlink project into it

export GOPATH="/go"
SHADOW_WORKSPACE="$GOPATH/src/$PROJECT_ROOT"
LINK_DIR="$(dirname "$SHADOW_WORKSPACE")"
mkdir -p "$LINK_DIR" || exit 1

ln -s "/workspace" "$SHADOW_WORKSPACE" -T 2> /dev/null || stat "$SHADOW_WORKSPACE" 2> /dev/null || exit 1

cd "$SHADOW_WORKSPACE"
/go/bin/dep "$@"