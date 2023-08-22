resource "harness_platform_gitops_applications" "guestbook" {
  application {
    metadata {
      annotations = {}
      labels = {
        "harness.io/serviceRef" = "testservice"
        "harness.io/envRef"     = "testenv"
      }
    name = "guestbook"
    }
    spec {
      sync_policy {
        automated {
          allow_empty = true
        }
        sync_options = [
          "PrunePropagationPolicy=undefined",
          "CreateNamespace=false",
          "Validate=false",
          "skipSchemaValidations=false",
          "autoCreateNamespace=false",
          "pruneLast=false",
          "applyOutofSyncOnly=false",
          "Replace=false",
          "retry=false"
        ]
      }
      source {
        target_revision = "master"
        repo_url        = var.repo_url
        path            = "guestbook"

      }
      destination {
        namespace = var.agent_namespace
        server    = "https://kubernetes.default.svc"
      }
    }
  }
  project_id = var.project_id
  org_id     = var.org_id
  account_id = var.account_id
  identifier = "guestbook"
  cluster_id = var.cluster_identifier
  repo_id    = var.repo_identifier
  agent_id   = var.agent_identifier
  name       = "guestbook"
  depends_on = [harness_platform_service.gitops_guestbook_service]
}
