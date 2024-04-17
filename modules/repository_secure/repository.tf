resource "github_repository" "default" {
  visibility   = "public"
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url
  topics       = var.topics

  has_discussions = true
  has_downloads   = true
  has_issues      = true
  has_projects    = false
  has_wiki        = true

  allow_auto_merge    = false
  allow_merge_commit  = true
  allow_rebase_merge  = true
  allow_squash_merge  = true
  allow_update_branch = false

  vulnerability_alerts = true

  pages {
    build_type = "workflow"
    source {
      branch = var.default_branch
      path   = "/"
    }
  }

  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}