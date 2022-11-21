terraform {
  required_version = ">= 1.3.0"

  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    nxos = {
      source  = "netascode/nxos"
      version = ">= 0.3.8"
    }
  }
}

# requirement
resource "nxos_feature_interface_vlan" "interface_vlan" {
  admin_state = "enabled"
}

resource "nxos_feature_hmm" "hmm" {
  admin_state = "enabled"
}

module "main" {
  source              = "../.."
  anycast_gateway_mac = "20:20:00:00:10:12"

  depends_on = [
    nxos_feature_interface_vlan.interface_vlan,
    nxos_feature_hmm.hmm
  ]
}

data "nxos_hmm" "hmmEntity" {
  depends_on = [module.main]
}

resource "test_assertions" "hmmEntity" {
  component = "hmmEntity"

  equal "admin_state" {
    description = "admin_state"
    got         = data.nxos_hmm.hmmEntity.admin_state
    want        = "enabled"
  }
}

data "nxos_hmm_instance" "hmmFwdInst" {
  depends_on = [module.main]
}

resource "test_assertions" "hmmFwdInst" {
  component = "hmmFwdInst"

  equal "anycast_mac" {
    description = "anycast_mac"
    got         = data.nxos_hmm_instance.hmmFwdInst.anycast_mac
    want        = "20:20:00:00:10:12"
  }
}

