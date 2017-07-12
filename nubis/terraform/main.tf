module "worker" {
  source       = "github.com/nubisproject/nubis-terraform//worker?ref=v1.5.0"
  region       = "${var.region}"
  environment  = "${var.environment}"
  account      = "${var.account}"
  service_name = "${var.service_name}"
  ami          = "${var.ami}"
  elb          = "${module.load_balancer.name}"

  # CPU utilisation based autoscaling (with good defaults)
  scale_load_defaults = true

  # Explicitely pick our load limits for up/down scaling


  #scale_up_load = 75


  #scale_down_load = 10

  # ldap group names
  nubis_sudo_groups = "team_webops,nubis_global_admins"
  nubis_user_groups = "team_webops"
}

module "load_balancer" {
  source       = "github.com/nubisproject/nubis-terraform//load_balancer?ref=v1.5.0"
  region       = "${var.region}"
  environment  = "${var.environment}"
  account      = "${var.account}"
  service_name = "${var.service_name}"
  ssl_cert_name_prefix = "pastebin"
}

module "database" {
  source                 = "github.com/nubisproject/nubis-terraform//database?ref=v1.5.0"
  region                 = "${var.region}"
  environment            = "${var.environment}"
  account                = "${var.account}"
  service_name           = "${var.service_name}"
  client_security_groups = "${module.worker.security_group}"
}

module "dns" {
  source       = "github.com/nubisproject/nubis-terraform//dns?ref=v1.5.0"
  region       = "${var.region}"
  environment  = "${var.environment}"
  account      = "${var.account}"
  service_name = "${var.service_name}"
  target       = "${module.load_balancer.address}"
}
