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
  client_identifier_name = "myclient"
  client_profile_name    = "default"
  acl_profile_name       = "default"

  // The "default" ACL profile, used in the example, has default actions "allow", so exceptions are "deny"

  // example of multiple publish topic exceptions
  acl_profile_publish_topic_exceptions = [
    {
      publish_topic_exception        = "a/b/c*",
      publish_topic_exception_syntax = "smf"
    },
    {
      // example of using substitution variable - no need to escape the $ character here
      publish_topic_exception        = "g/$client-username",
      publish_topic_exception_syntax = "smf"
    }
  ]

  // example subscribe topic exception
  acl_profile_subscribe_topic_exceptions = [
    {
      subscribe_topic_exception        = "j/k/l",
      subscribe_topic_exception_syntax = "smf"
    }
  ]

  // example subscribe share name exception
  acl_profile_subscribe_share_name_exceptions = [
    {
      subscribe_share_name_exception        = "share-test1",
      subscribe_share_name_exception_syntax = "smf"
    }
  ]

  // example client connect exceptions
  acl_profile_client_connect_exceptions = ["192.0.2.0/24", "2001:db8::/32"]

  // No need to set enabled, it defaults to true
  // enabled = true
}

output "client_username" {
  value     = module.testclient.client_username
  sensitive = true
}

output "publish_topic_exceptions" {
  value = module.testclient.acl_profile_publish_topic_exceptions
}

output "subscribe_topic_exceptions" {
  value = module.testclient.acl_profile_subscribe_topic_exceptions
}

output "subscribe_share_name_exceptions" {
  value = module.testclient.acl_profile_subscribe_share_name_exceptions
}

output "client_connect_exceptions" {
  value = module.testclient.acl_profile_client_connect_exceptions
}
