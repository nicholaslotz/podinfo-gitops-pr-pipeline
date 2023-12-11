# Deploy Podinfo Appset via Harness GitOps and terraform

## Summary

## High level instructions

### Provisioning
1. Clone this repo to a machine that has Terraform and Terragrunt installed.
1. Set your Harness credentials. Run `export TF_VAR_harness_api_token=<your Harness access token>`. <br/> **NOTE** Be sure not to add your PAT to .tfvars!
1. Set your Harness account info. Run `export TF_VAR_account_id=<your Harness account ID>`. Your account ID can be found in the web URL when accessing the Harness app.
1. Run `terragrunt run-all apply` and confirm when prompted. Terraform will provision the Harness GitOps agent, install the agent in the cluster, create other Harness resources, and deploy the guestbook application. 
1. Run `kubectl get pods -n dev` and verify the podinfo application was deployed.

### Cleanup
1. Run `terragrunt run-all destroy` from the **gitops-terraform-onboarding/** directory. Confirm when prompted.
