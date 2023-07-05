terraform {
  source = "git@github.com:jkarkoszka/baseline-common.git"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl")).locals
  region       = regex("/(eu-west-3|eu-central-1|global)/", get_terragrunt_dir())[0]
}

dependency "baseline_common_global" {
  config_path = "../../global/baseline-common-global"
  mock_outputs = {
   result = "test-result"
  }
}

dependency "baseline_common_result" {
  config_path = local.region == "eu-central-1" ? "../../global/baseline-common-global" : "../../eu-central-1/baseline-common"
  mock_outputs = {
   result = "test-result"
  }
}

inputs = {
    region = local.region
    account_name = local.account_vars.account_name
    depedencies_result = dependency.baseline_common_result.outputs.result
}

