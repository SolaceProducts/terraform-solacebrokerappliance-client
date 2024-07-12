# Copyright 2024 Solace Corporation. All rights reserved.
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

provider "solacebroker" {
  username = "admin"
  password = "admin"
  url      = "http://localhost:8080" # adjust to your appliance management host and SEMP port
}

module "testclient" {
  source = "../.."

  msg_vpn_name           = "default"
  client_identifier_type = "client_username"
  client_identifier_name = "myclientwithattributes"
  client_profile_name    = "default"
  acl_profile_name       = "default"

  // Optional attributes example. One of the main use cases is client certificates authentication, no password is set here
  client_username_attributes = [
    {
      attribute_name  = "ou"
      attribute_value = "Unit1"
    }
  ]

  // No need to set enabled, it defaults to true
  // enabled = true
}

output "client_username" {
  value     = module.testclient.client_username
  sensitive = true
}

output "attributes" {
  value = module.testclient.client_username_attributes
}
