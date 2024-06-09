resource "github_repository_collaborators" "default" {
  repository = github_repository.default.name

  dynamic "user" {
    for_each = var.collaborators
    content {
      username   = user.value
      permission = "push"
    }
  }
}