variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "homepage_url" {
  type    = string
  default = null
}

variable "topics" {
  type = list(string)
}

variable "default_branch" {
  type    = string
  default = "main"
}

variable "collaborators" {
  type    = list(string)
  default = []
}