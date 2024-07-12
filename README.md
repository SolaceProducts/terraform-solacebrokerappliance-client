# Solace PubSub+ Appliance Client Terraform Module

This Terraform module provisions a client identifier for [authorization](https://docs.solace.com/Security/Client-Authorization-Overview.htm) when connecting to the [Solace PubSub+ Appliance](https://solace.com/products/event-broker/). The module also provides the option to adjust the assigned ACL profile through defining ACL profile exceptions, and to define additional attributes for client usernames.

The identifier may be one of:
* [Client username](https://docs.solace.com/Security/Configuring-Client-Usernames.htm); or
* Authorization group (used for [OAuth](https://docs.solace.com/Security/Client-Authorization-Overview.htm#Authoriz2) or [LDAP](https://docs.solace.com/Security/Client-Authorization-Overview.htm#LDAP-Groups))

Specific use case details are provided in the [Examples](#examples) section.

## Module input variables

### Required

* `msg_vpn_name` - Client usernames or authorization groups are specific to a Message VPN on the broker.
* `client_identifier_type` - One of `client_username` or `authorization_group`.
* `client_identifier_name` - The name of the client identifier.
* `acl_profile_name` - The ACL profile to be assigned for authorization.
* `client_profile_name` - The client profile to be assigned for authorization.

### Optional

* `password` - If you are using a client username to identify the client and configured basic authentication with internal database for the Message VPN, this variable provisions a password for authentication.
* `acl_profile_publish_topic_exceptions`, `acl_profile_subscribe_share_name_exceptions`, `acl_profile_subscribe_topic_exceptions`, `acl_profile_client_connect_exceptions` - Optional exceptions that you can add to modify the assigned ACL profile, to support specific needs of the client.
* `client_username_attributes` - A set of attributes that you can define in case of using a client username.

Additional optional module variable names are the same as the underlying resource attributes. To determine the variable name mappings, we recommend that you look for matching attribute names in the documentation for the resource:

| Resource name |
|---------------|
|[solacebroker_msg_vpn_client_username](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_username#optional)|
|[solacebroker_msg_vpn_authorization_group](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_authorization_group#optional)|
|[solacebroker_msg_vpn_acl_profile_publish_topic_exception](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile_publish_topic_exception#optional)|
|[solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile_subscribe_share_name_exception#optional)|
|[solacebroker_msg_vpn_acl_profile_subscribe_topic_exception](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile_subscribe_topic_exception#optional)|
|[solacebroker_msg_vpn_acl_profile_client_connect_exception](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_acl_profile_client_connect_exception#optional)|
|[solacebroker_msg_vpn_client_username_attribute](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_username_attribute#optional)|

The default value for most of the optional variables is `null`, meaning that if you don’t provide a value then the default value of the resource is provisioned on the event broker.

-> The module default for the `enabled` optional variable is `true`, which differs from the resource attribute default.

## Module outputs

[Module outputs](https://developer.hashicorp.com/terraform/language/values/outputs) provide reference to created resources. Any reference to a resource that has not been created will be set to `(null)`.

Note that the "client username" and the "authorization group" outputs are [sensitive](https://developer.hashicorp.com/terraform/language/values/outputs#sensitive-suppressing-values-in-cli-output).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_solacebrokerappliance"></a> [solacebrokerappliance](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest) | >= 1.0 |

## Resources

The following table shows the resources created for each `client_identifier_type` value. "X" denotes a resource that is always created, "O" denotes a resource that you have the option to create.  

| Name | client_username | authorization_group |
|------|------|------|
| solacebroker_msg_vpn_client_username | X | |
| solacebroker_msg_vpn_client_username_attribute | O | |
| solacebroker_msg_vpn_authorization_group | | X |
| solacebroker_msg_vpn_acl_profile_publish_topic_exception | O | O |
| solacebroker_msg_vpn_acl_profile_subscribe_share_name_exception | O | O |
| solacebroker_msg_vpn_acl_profile_subscribe_topic_exception | O | O |
| solacebroker_msg_vpn_acl_profile_client_connect_exception | O | O |


## Examples

The following examples demonstrate several specific use cases for this module:

- [Client username](examples/basic-client-username)
- [Client username attributes](examples/client-username-attributes)
- [Authorization group](examples/authorization-group)
- [ACL profile exceptions](examples/acl-profile-exceptions)

## Module use recommendations

This module is expected to be used primarily by application teams. It supports provisioning a client username or an authorization group with possible adjustments, required by a specific application. It may be forked and adjusted with private defaults.

## Resources

For more information about Solace technology in general please visit these resources:

- Solace [Technical Documentation](https://docs.solace.com/)
    - [Client Authorization](https://docs.solace.com/Security/Client-Authorization-Overview.htm)
- The Solace Developer Portal website at: [solace.dev](//solace.dev/)
- Understanding [Solace technology](//solace.com/products/platform/)
- Ask the [Solace community](//dev.solace.com/community/).
