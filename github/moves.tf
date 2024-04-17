# ----------------------------------------------------------------------------------------------------------------------
# 2024-04-16
# ----------------------------------------------------------------------------------------------------------------------

moved {
  from = github_repository.expressions
  to   = module.expressions.github_repository.default
}

moved {
  from = github_repository_ruleset.expressions_default_branch
  to   = module.expressions.github_repository_ruleset.default_branch
}