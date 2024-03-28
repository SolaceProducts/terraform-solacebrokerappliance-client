locals {
  acl_profile_publish_topic_exceptions_list        = tolist(var.acl_profile_publish_topic_exceptions)
  acl_profile_subscribe_share_name_exceptions_list = tolist(var.acl_profile_subscribe_share_name_exceptions)
  acl_profile_subscribe_topic_exceptions_list      = tolist(var.acl_profile_subscribe_topic_exceptions)
  client_username_attribute_list                   = tolist(var.client_username_attributes)
}

resource "solacebroker_msg_vpn_client_username" "main" {
  count = var.client_identifier_type == "client_username" ? 1 : 0

  msg_vpn_name        = var.msg_vpn_name
  client_username     = var.client_identifier_name
  client_profile_name = var.client_profile_name
  acl_profile_name    = var.acl_profile_name
  enabled             = var.enabled

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_authorization_group" "main" {
  count = var.client_identifier_type == "authorization_group" ? 1 : 0

  msg_vpn_name             = var.msg_vpn_name
  authorization_group_name = var.client_identifier_name
  client_profile_name      = var.client_profile_name
  acl_profile_name         = var.acl_profile_name
  enabled                  = var.enabled

  #AutoAddAttributes #EnableCommonVariables
}

resource "solacebroker_msg_vpn_acl_profile_publish_topic_exception" "main" {
  count = length(local.acl_profile_publish_topic_exceptions_list)

  msg_vpn_name                   = var.msg_vpn_name
  acl_profile_name               = var.acl_profile_name
  publish_topic_exception        = local.acl_profile_publish_topic_exceptions_list[count.index].publish_topic_exception
  publish_topic_exception_syntax = local.acl_profile_publish_topic_exceptions_list[count.index].publish_topic_exception_syntax
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_topic_exception" "main" {
  count = length(local.acl_profile_subscribe_topic_exceptions_list)

  msg_vpn_name                     = var.msg_vpn_name
  acl_profile_name                 = var.acl_profile_name
  subscribe_topic_exception        = local.acl_profile_subscribe_topic_exceptions_list[count.index].subscribe_topic_exception
  subscribe_topic_exception_syntax = local.acl_profile_subscribe_topic_exceptions_list[count.index].subscribe_topic_exception_syntax
}

resource "solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception" "main" {
  count = length(local.acl_profile_subscribe_share_name_exceptions_list)

  msg_vpn_name                          = var.msg_vpn_name
  acl_profile_name                      = var.acl_profile_name
  subscribe_share_name_exception        = local.acl_profile_subscribe_share_name_exceptions_list[count.index].subscribe_share_name_exception
  subscribe_share_name_exception_syntax = local.acl_profile_subscribe_share_name_exceptions_list[count.index].subscribe_share_name_exception_syntax
}

resource "solacebroker_msg_vpn_acl_profile_client_connect_exception" "main" {
  count = length(var.acl_profile_client_connect_exceptions)

  msg_vpn_name                     = var.msg_vpn_name
  acl_profile_name                 = var.acl_profile_name
  client_connect_exception_address = var.acl_profile_client_connect_exceptions[count.index]
}

resource "solacebroker_msg_vpn_client_username_attribute" "main" {
  count = var.client_identifier_type == "client_username" ? length(local.client_username_attribute_list) : 0

  msg_vpn_name    = solacebroker_msg_vpn_client_username.main[0].msg_vpn_name
  client_username = solacebroker_msg_vpn_client_username.main[0].client_username
  attribute_name  = local.client_username_attribute_list[count.index].attribute_name
  attribute_value = local.client_username_attribute_list[count.index].attribute_value
}

