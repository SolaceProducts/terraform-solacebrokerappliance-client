# Authorization Group Configuration Example

Configuration in this directory creates an authorization group on the PubSub+ event broker, leveraging the Client Terraform module. The authorization group can be used for [OAuth](https://docs.solace.com/Security/Client-Authorization-Overview.htm#Authoriz2) or [LDAP](https://docs.solace.com/Security/Client-Authorization-Overview.htm#LDAP-Groups) authorization.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - set to `default` in the example
* `client_identifier_type` - set to `authorization_group`
* `client_identifier_name` - set to `myauthgroup` in the example.
* `client_profile_name` - `default`, in the example
* `acl_profile_name` - `default`, in the example

### Optional Inputs

Optional module input variables have the same name as the attributes of the underlying provider resource. If omitted then the default for the related resource attribute will be configured on the broker. For attributes and defaults, refer to the [documentation of "solacebroker_msg_vpn_authorization_group"](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs/resources/msg_vpn_authorization_group#optional).

The module default for the `enabled` variable is true, which enables the authorization group.

### Output

The module `authorization_group` output refers to the created authorization group.

## Created resources

This example will create following resources:

* `solacebroker_msg_vpn_authorization_group`

## Running the Example

### Access to a PubSub+ broker

If you don't already have access to a broker, refer to the [Developers page](https://www.solace.dev/) for options to get started.

### Sample source code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebroker-rest-delivery.git
cd examples/authorization-group
```

### Adjust Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/SolaceProducts/solacebroker/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the resource

Hint: You can verify configuration changes on the broker, before and after, using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm)

Execute from this folder:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` to clean up created resources when no longer needed.

## Additional Documentation

Refer to the [Configuring Client Authorization](https://docs.solace.com/Security/Configuring-Client-Authorization.htm) section in the PubSub+ documentation.
