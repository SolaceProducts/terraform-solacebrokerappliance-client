# Output variable definitions

output "client_username" {
  value     = try(solacebroker_msg_vpn_client_username.main[0], null)
  sensitive = true
}

output "authorization_group" {
  value     = try(solacebroker_msg_vpn_authorization_group.main[0], null)
  sensitive = true
}

output "acl_profile_publish_topic_exceptions" {
  value = try(solacebroker_msg_vpn_acl_profile_publish_topic_exception.main, null)
}

output "acl_profile_subscribe_share_name_exceptions" {
  value = try(solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception.main, null)
}

output "acl_profile_subscribe_topic_exceptions" {
  value = try(solacebroker_msg_vpn_acl_profile_subscribe_topic_exception.main, null)
}

output "acl_profile_client_connect_exceptions" {
  value = try(solacebroker_msg_vpn_acl_profile_client_connect_exception.main, null)
}

output "client_username_attributes" {
  value = try(solacebroker_msg_vpn_client_username_attribute.main, null)
}

