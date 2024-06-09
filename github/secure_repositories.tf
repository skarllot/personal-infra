module "expressions" {
  source = "../modules/repository_secure"

  name          = "Expressions"
  description   = "Provides base for specifications to a DDD model"
  homepage_url  = "https://fgodoy.me/Expressions/"
  topics        = ["database", "ef-core", "martendb", "query", "repository", "specification"]
  collaborators = [data.github_user.fgodoy_lepaho.username]
}

module "toolkit" {
  source = "../modules/repository_secure"

  name          = "RaiqubToolkit"
  description   = "Provides a set of libraries to help any .NET application"
  topics        = ["span", "json"]
  collaborators = [data.github_user.fgodoy_lepaho.username]
}