terraform {
  source = "git@github.com:jkarkoszka/baseline-common.git"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
  region       = regex("/(eu-west-3|eu-central-1|global)/", get_terragrunt_dir())[0]
}

inputs = {
    region       = local.region
    account_name = local.account_vars.account_name
}
