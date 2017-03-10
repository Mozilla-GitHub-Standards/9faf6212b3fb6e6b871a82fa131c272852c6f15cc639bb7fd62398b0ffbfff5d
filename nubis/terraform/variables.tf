variable "account" {}

variable "region" {
  default = "us-west-2"
}

variable "environment" {
  default = "stage"
}

variable "service_name" {
  default = "dpaste"
}

variable "ami" {
  default = ""
}

variable "nubis_sudo_groups" {
  default = "nubis_global_admins,team_webops"
}

variable "nubis_user_groups" {
  default = "team_webops"
}
