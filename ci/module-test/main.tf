provider "solacebroker" {
  username       = "admin"
  password       = "admin"
  url            = "http://localhost:8080"
  skip_api_check = true
}

module "testclientusername" {
  source = "../.."
  # version = ""

  msg_vpn_name           = "default"
  client_identifier_name = "myclient"
  client_identifier_type = "client_username"
  client_profile_name    = "default"
  acl_profile_name       = "default"
  password               = "mypassword"
  acl_profile_publish_topic_exceptions = [
    {
      publish_topic_exception        = "pub_test1"
      publish_topic_exception_syntax = "smf"
    },
    {
      publish_topic_exception        = "pub_test2"
      publish_topic_exception_syntax = "mqtt"
    }
  ]
  acl_profile_subscribe_share_name_exceptions = [
    {
      subscribe_share_name_exception        = "share_test1"
      subscribe_share_name_exception_syntax = "smf"
    },
    {
      subscribe_share_name_exception        = "share_test2"
      subscribe_share_name_exception_syntax = "mqtt"
    }
  ]
  acl_profile_subscribe_topic_exceptions = [
    {
      subscribe_topic_exception        = "sub_test1"
      subscribe_topic_exception_syntax = "smf"
    },
    {
      subscribe_topic_exception        = "sub_test2"
      subscribe_topic_exception_syntax = "mqtt"
    }
  ]
  acl_profile_client_connect_exceptions = ["192.0.2.0/24", "2001:db8::/32"]
  client_username_attributes = [
    {
      attribute_name  = "client-username-attribute1"
      attribute_value = "client-username-attribute-value1"
    },
    {
      attribute_name  = "client-username-attribute2"
      attribute_value = "client-username-attribute-value2"
    }
  ]
}

output "client_username" {
  value     = module.testclientusername.client_username
  sensitive = true
}

output "acl_profile_publish_topic_exceptions" {
  value = module.testclientusername.acl_profile_publish_topic_exceptions
}

output "acl_profile_subscribe_share_name_exceptions" {
  value = module.testclientusername.acl_profile_subscribe_share_name_exceptions
}

output "acl_profile_subscribe_topic_exceptions" {
  value = module.testclientusername.acl_profile_subscribe_topic_exceptions
}

output "acl_profile_client_connect_exceptions" {
  value = module.testclientusername.acl_profile_client_connect_exceptions
}

output "client_username_attributes" {
  value = module.testclientusername.client_username_attributes
}

module "testauthorizationgroup" {
  source = "../.."
  # version = ""

  msg_vpn_name           = "default"
  client_identifier_name = "myauthorizationgroup"
  client_identifier_type = "authorization_group"
  client_profile_name    = "default"
  acl_profile_name       = "default"
}

output "authorization_group" {
  value     = module.testauthorizationgroup.authorization_group
  sensitive = true
}

