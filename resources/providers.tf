terraform {  
    required_providers {  
        harness = {  
            source = "harness/harness"  
            version = "0.24.2"  
        }
        kubernetes = {
          source = "hashicorp/kubernetes"
          version = "2.24.0"
        }
    }
}  

provider "kubernetes" {
    config_path    = "~/.kube/config"
}

provider "harness" {  
    endpoint   = "https://app.harness.io/gateway"  
    account_id = var.account_id  
    platform_api_key = var.harness_api_token 
}



