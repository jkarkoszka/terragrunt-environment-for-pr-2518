terraform {
  source = "git@github.com:jkarkoszka/baseline-common.git"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl")).locals
  region       = local.region_vars.region
}

inputs = {
    region       = local.region
    account_name = local.account_vars.account_name
}
