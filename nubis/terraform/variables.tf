variable "account" {
  default = "appsvcs-pastebin"
}

variable "region" {
  default = "us-west-2"
}

variable "environment" {
  default = "stage"
}

variable "service_name" {
  default = "appsvcs-pastebin"
}

variable "ami" {}

variable "nubis_sudo_groups" {
  default = "team_webops,nubis_global_admins"
}

variable "nubis_user_groups" {
  default = "team_webops"
}
