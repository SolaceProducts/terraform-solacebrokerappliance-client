# Input variable definitions

# Required variables

variable "msg_vpn_name" {
  description = "The name of the Message VPN"
  type        = string
}

variable "client_identifier_type" {
  description = "The type of client identifier to be configured. Must be one of `client_username` or `authorization_group`"
  type        = string
  validation {
    condition     = contains(["client_username", "authorization_group"], var.client_identifier_type)
    error_message = "The client_identifier_type must be one of `client_username` or `authorization_group`"
  }
}

variable "client_identifier_name" {
  description = "The name of the client identifier"
  type        = string
}

variable "acl_profile_name" {
  description = "The ACL Profile to be used"
  type        = string
}

variable "client_profile_name" {
  description = "The client profile to be used as common configuration properties to the client"
  type        = string
}

# Optional variables

variable "enabled" {
  description = "Enable or disable the client"
  type        = bool
  default     = true
}

#AutoAddAttributes

variable "acl_profile_publish_topic_exceptions" {
  description = "A set of exceptions to the default action to take when a client using the ACL Profile publishes to a topic in the Message VPN"
  type = set(object({
    publish_topic_exception        = string
    publish_topic_exception_syntax = string
  }))
  default = []
}

variable "acl_profile_subscribe_share_name_exceptions" {
  description = "A set of exceptions to the default action to take when a client using the ACL Profile subscribes to a share-name subscription in the Message VPN"
  type = set(object({
    subscribe_share_name_exception        = string
    subscribe_share_name_exception_syntax = string
  }))
  default = []
}

variable "acl_profile_subscribe_topic_exceptions" {
  description = "A set of exceptions to the default action to take when a client using the ACL Profile subscribes to a topic in the Message VPN"
  type = set(object({
    subscribe_topic_exception        = string
    subscribe_topic_exception_syntax = string
  }))
  default = []
}

variable "acl_profile_client_connect_exceptions" {
  description = "List of client connect exceptions to the default action to take when a client using the ACL Profile connects to the Message VPN. Exceptions must be expressed as an IP address/netmask in CIDR form"
  type        = list(string)
  default     = []
}

variable "client_username_attributes" {
  description = "A set of key+value pairs that can be used to locate a client username, for example when using client certificate mapping"
  type = set(object({
    attribute_name  = string
    attribute_value = string
  }))
  default = []
}

