terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  vim_keep_alive = 30
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  api_timeout    = 20

  # If you have a self-signed cert
  allow_unverified_ssl = true
}