terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }

  backend "local" {}
}

provider "github" {
  owner = "skarllot"
  token = var.GITHUB_TOKEN
}