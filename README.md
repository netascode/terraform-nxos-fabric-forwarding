<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-nxos-fabric-forwarding/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-nxos-fabric-forwarding/actions/workflows/test.yml)

# Terraform NX-OS Fabric Forwarding Module

Manages NX-OS Fabric Forwarding Configurations

Model Documentation: [Link](https://developer.cisco.com/docs/cisco-nexus-3000-and-9000-series-nx-api-rest-sdk-user-guide-and-api-reference-release-9-3x/#!configuring-hmm)

## Examples

```hcl
module "nxos_fabric_forwarding" {
  source  = "netascode/fabric-forwarding/nxos"
  version = ">= 0.1.0"

  anycast_gateway_mac = "20:20:00:00:10:12"
  vlan_interfaces = [
    {
      id = 14
    },
    {
      id   = 15
      mode = "proxyGW"
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_nxos"></a> [nxos](#requirement\_nxos) | >= 0.3.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nxos"></a> [nxos](#provider\_nxos) | >= 0.3.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_device"></a> [device](#input\_device) | A device name from the provider configuration. | `string` | `null` | no |
| <a name="input_anycast_gateway_mac"></a> [anycast\_gateway\_mac](#input\_anycast\_gateway\_mac) | Fabric forwarding anycast gateway mac specified by command `fabric forwarding anycast-gateway-mac`. Format: `XX:XX:XX:XX:XX:XX`. | `string` | n/a | yes |
| <a name="input_vlan_interfaces"></a> [vlan\_interfaces](#input\_vlan\_interfaces) | List of VLAN interfaces configured with command `fabric forwarding mode anycast-gateway`. Choices `mode`: `anycastGW`, `proxyGW`. Default value `mode`: `anycastGW`. | <pre>list(object({<br>    id   = number<br>    mode = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of the object. |

## Resources

| Name | Type |
|------|------|
| [nxos_hmm.hmmEntity](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/hmm) | resource |
| [nxos_hmm_instance.hmmFwdInst](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/hmm_instance) | resource |
| [nxos_hmm_interface.hmmFwdIf](https://registry.terraform.io/providers/netascode/nxos/latest/docs/resources/hmm_interface) | resource |
<!-- END_TF_DOCS -->