variable "compartment_ocid" {

}

variable "tenancy_ocid" {

}

variable "user_ocid" {

}

variable "fingerprint" {

}

variable "private_key_path" {

}

variable "region" {
  default = "ap-sydney-1"
}

module "k3s_cluster" {
  # k3s_version               = "v1.23.8+k3s2" # Fix kubectl exec failure
  # k3s_version               = "v1.24.4+k3s1" # Kubernetes version compatible with longhorn
  region                    = var.region
  availability_domain       = "aRdH:AP-SYDNEY-1-AD-1"
  tenancy_ocid              = var.tenancy_ocid
  compartment_ocid          = var.compartment_ocid
  my_public_ip_cidr         = "144.136.23.46"
  cluster_name              = "ERPOmega"
  environment               = "staging"
  PATH_TO_PUBLIC_LB_CERT = "/home/ubuntu/public.crt"
  PATH_TO_PUBLIC_LB_KEY  = "/home/ubuntu/privatekey.pem"
  os_image_id               = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaixfzzk57grv3tsmhl2fsh3a54jnnu7og4ruxp377i77hq2b5f2sq"
  certmanager_email_address = "cwgort@outlook.com"
  source                    = "../"
}

output "k3s_servers_ips" {
  value = module.k3s_cluster.k3s_servers_ips
}

output "k3s_workers_ips" {
  value = module.k3s_cluster.k3s_workers_ips
}

output "public_lb_ip" {
  value = module.k3s_cluster.public_lb_ip
}
