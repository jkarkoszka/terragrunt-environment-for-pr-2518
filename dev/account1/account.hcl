locals {
  current_dir  = get_terragrunt_dir()
  account_name = basename(local.current_dir)
}