variable "device" {
  description = "A device name from the provider configuration."
  type        = string
  default     = null
}

variable "anycast_gateway_mac" {
  description = "Fabric forwarding anycast gateway mac specified by command `fabric forwarding anycast-gateway-mac`. Format: `XX:XX:XX:XX:XX:XX`."
  type        = string

  validation {
    condition     = can(regex("^\\S\\S:\\S\\S:\\S\\S:\\S\\S:\\S\\S:\\S\\S$", var.anycast_gateway_mac))
    error_message = "Allowed format: `XX:XX:XX:XX:XX:XX`."
  }
}

variable "vlan_interfaces" {
  description = "List of VLAN interfaces configured with command `fabric forwarding mode anycast-gateway`. Choices `mode`: `anycastGW`, `proxyGW`. Default value `mode`: `anycastGW`."
  type = list(object({
    id   = number
    mode = optional(string)
  }))
  default = []

  validation {
    condition = alltrue([
      for v in var.vlan_interfaces : try(v.id >= 1 && v.id <= 4094, false)
    ])
    error_message = "`id`: Minimum value: 1. Maximum value: 4094."
  }

  validation {
    condition = alltrue([
      for v in var.vlan_interfaces : try(contains(["anycastGW", "proxyGW"], v.mode), v.mode == null)
    ])
    error_message = "`mode`: Allowed values are: `anycastGW` or `proxyGW`."
  }
}
