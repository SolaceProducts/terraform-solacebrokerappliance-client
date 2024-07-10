# Client Username Attributes Configuration Example

This directory demonstrates the configuration of a client username with additional [client username attributes](https://docs.solace.com/Security/Configuring-Client-Usernames.htm?Highlight=client%20username%20attributes#Setting) on the PubSub+ appliance, leveraging the Client Terraform module.

## Module Configuration in the Example

### Required Inputs

* `msg_vpn_name` - Set to `default` in the example.
* `client_identifier_type` - Set to `client_username` in the example.
* `client_identifier_name` - Set to `myclientwithattributes` in the example.
* `client_profile_name` - Set to `default` in the example.
* `acl_profile_name` - Set to `default` in the example.

### Optional Inputs

* `client_username_attributes` - a set of attributes in a list form.

Optional module input variables have the same name as the attributes of the underlying provider resource. If omitted, then the default for the related resource attribute will be configured on the broker. For a list of attributes and the corresponding defaults, see the [documentation of "solacebroker_msg_vpn_client_username"](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs/resources/msg_vpn_client_username#optional).

The module default for the `enabled` variable is true, which enables the client username.

### Output

The module `client_username` output refers to the created client username and the `attributes` output provides the list of created attributes.

## Created Resources

This example will create the following resources:

* `solacebroker_msg_vpn_client_username`
* `solacebroker_msg_vpn_client_username_attribute`

## Running the Example

### Access to a PubSub+ Appliance

If you don't already have access to a broker, see the [Developers page](https://www.solace.dev/) for options to get started.

### Sample Source Code

The sample is available from the module GitHub repo:

```bash
git clone https://github.com/SolaceProducts/terraform-solacebrokerappliance-rest-delivery.git
cd examples/client-username-attributes
```

### Adjust the Provider Configuration

Adjust the [provider parameters](https://registry.terraform.io/providers/SolaceProducts/solacebrokerappliance/latest/docs#schema) in `main.tf` according to your broker. The example configuration shows settings for a local broker running in Docker.

### Create the Resource

Tip: You can verify configuration changes on the broker, before and after, using the [PubSub+ Broker Manager Web UI](https://docs.solace.com/Admin/Broker-Manager/PubSub-Manager-Overview.htm).

Execute from this folder:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` to clean up the created resources when they are no longer needed.

## Additional Documentation

For more information, see [Configuring Client Authorization](https://docs.solace.com/Security/Configuring-Client-Authorization.htm) section in the PubSub+ documentation.
