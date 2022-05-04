locals {
  vlan_interfaces = { for v in var.vlan_interfaces : v.id => v }
}

resource "nxos_hmm" "hmmEntity" {
  device = var.device
}

resource "nxos_hmm_instance" "hmmFwdInst" {
  device      = var.device
  anycast_mac = var.anycast_gateway_mac

  depends_on = [
    nxos_hmm.hmmEntity
  ]
}

resource "nxos_hmm_interface" "hmmFwdIf" {
  for_each     = local.vlan_interfaces
  device       = var.device
  interface_id = "vlan${each.value.id}"
  mode         = each.value.mode

  depends_on = [
    nxos_hmm_instance.hmmFwdInst
  ]
}
