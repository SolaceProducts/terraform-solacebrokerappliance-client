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

# Output variable definitions

output "client_username" {
  value       = try(solacebroker_msg_vpn_client_username.main[0], null)
  sensitive   = true
  description = "A client is only authorized to connect to a Message VPN that is associated with a Client Username that the client has been assigned"
}

output "authorization_group" {
  value       = try(solacebroker_msg_vpn_authorization_group.main[0], null)
  sensitive   = true
  description = "To use client authorization groups configured on an external server to provide client authorizations, Authorization Group objects must be created on the Message VPN that match the authorization groups provisioned on the external server. These objects must be configured with the client profiles and ACL profiles that will be assigned to the clients that belong to those authorization groups. A newly created group is placed at the end of the group list which is the lowest priority"
}

output "acl_profile_publish_topic_exceptions" {
  value       = try(solacebroker_msg_vpn_acl_profile_publish_topic_exception.main, null)
  description = "A Publish Topic Exception is an exception to the default action to take when a client using the ACL Profile publishes to a topic in the Message VPN. Exceptions must be expressed as a topic"
}

output "acl_profile_subscribe_share_name_exceptions" {
  value       = try(solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception.main, null)
  description = "A Subscribe Share Name Exception is an exception to the default action to take when a client using the ACL Profile subscribes to a share-name subscription in the Message VPN. Exceptions must be expressed as a topic"
}

output "acl_profile_subscribe_topic_exceptions" {
  value       = try(solacebroker_msg_vpn_acl_profile_subscribe_topic_exception.main, null)
  description = "A Subscribe Topic Exception is an exception to the default action to take when a client using the ACL Profile subscribes to a topic in the Message VPN. Exceptions must be expressed as a topic"
}

output "acl_profile_client_connect_exceptions" {
  value       = try(solacebroker_msg_vpn_acl_profile_client_connect_exception.main, null)
  description = "A Client Connect Exception is an exception to the default action to take when a client using the ACL Profile connects to the Message VPN. Exceptions must be expressed as an IP address/netmask in CIDR form"
}

output "client_username_attributes" {
  value       = try(solacebroker_msg_vpn_client_username_attribute.main, null)
  description = "A ClientUsername Attribute is a key+value pair that can be used to locate a client username, for example when using client certificate mapping"
}


