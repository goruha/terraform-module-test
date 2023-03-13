resource "random_integer" "example" {
  count   = module.this.enabled ? 1 : 0
  testing = local.testing ? 0 : 1
  min     = 1
  max     = 50000
  keepers = {
    example = var.example
  }
}

locals {
  testing = true
  example = format("%v %v", var.example, join("", random_integer.example[*].result))
}
