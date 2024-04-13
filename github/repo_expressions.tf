resource "github_repository" "expressions" {
  visibility   = "public"
  name         = "Expressions"
  description  = "Provides base for specifications to a DDD model"
  homepage_url = "https://fgodoy.me/Expressions/"
  topics       = ["database", "ef-core", "martendb", "query", "repository", "specification"]

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
      branch = "main"
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

locals {
  github_actions_integration_id = 15368
}

resource "github_repository_ruleset" "expressions_default_branch" {
  repository  = github_repository.expressions.name
  name        = "Default branch"
  enforcement = "active"
  target      = "branch"

  conditions {
    ref_name {
      exclude = []
      include = ["~DEFAULT_BRANCH"]
    }
  }

  rules {
    creation                      = true
    deletion                      = true
    non_fast_forward              = true
    required_linear_history       = true
    required_signatures           = false
    update                        = false
    update_allows_fetch_and_merge = false

    pull_request {
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = true
      require_last_push_approval        = true
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }

    required_status_checks {
      strict_required_status_checks_policy = true
      required_check {
        context        = "build"
        integration_id = local.github_actions_integration_id
      }
      required_check {
        context        = "dependency-review"
        integration_id = local.github_actions_integration_id
      }
    }
  }
}