<!-- BEGIN_TF_DOCS -->
# NX-OS Fabric Forwarding Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "nxos_fabric_forwarding" {
  source  = "netascode/fabric-forwarding/nxos"
  version = ">= 0.2.0"

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
<!-- END_TF_DOCS -->