module "windows_vm" {
  source = "../.."

  resource_group = "az-rg-example-basic"
  key_vault      = "az-kv-example-basic"

  tags = {
    "context"     = "example"
    "project"     = "basic"
    "environment" = "dev/test"
  }
}
