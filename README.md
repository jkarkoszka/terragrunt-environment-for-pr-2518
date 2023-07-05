# Terragrunt Sandbox for debugging 

For PR / issue described here: https://github.com/gruntwork-io/terragrunt/pull/2518

## Repostiory overview

In bin/ folder there are two versions of terragrunt: original terragrunt-v0.44.5 and terragrunt-v0.44.5 with the fix applied

## Reproduction steps

1. Go to baseline-common module in region eu-west-3
    
    cd dev/account1/eu-west-3/baseline-common

2. Run terragrunt run-all init with original version. It should produce 'Found a dependency cycle between modules' error.

    ../../../../bin/terragrunt-v0.44.5 run-all init --terragrunt-use-partial-parse-config-cache --terragrunt-include-external-dependencies

3. Run terragrunt run-all init with the version with fix applied. It should finish correctly

    ../../../../bin/terragrunt-v0.44.5-with-fix run-all init --terragrunt-use-partial-parse-config-cache --terragrunt-include-external-dependencies

4. Using original version, you can also do init/plan/apply to check that without partial cache enable it works correctly

    ../../../../bin/terragrunt-v0.44.5 run-all init --terragrunt-include-external-dependencies

    ../../../../bin/terragrunt-v0.44.5 run-all apply --terragrunt-include-external-dependencies