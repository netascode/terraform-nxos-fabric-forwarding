module "nxos_fabric_forwarding" {
  source  = "netascode/fabric-forwarding/nxos"
  version = ">= 0.0.1"

  anycast_gateway_mac = "20:20:00:00:10:12"
  vlan_interfaces = [
    {
      id   = 14
      mode = "anycastGW"
    },
    {
      id   = 15
      mode = "anycastGW"
    }
  ]
}
