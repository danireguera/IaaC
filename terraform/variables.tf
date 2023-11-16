variable "vsphere_server" {
  type        = string
  description = "The name of the vSphere server"
}

variable "vsphere_username" {
  type        = string
  description = "The username of the vSphere account"
}

variable "vsphere_password" {
  type        = string
  description = "The password of the vSphere account"
}

variable "vsphere_datacenter" {
  type        = string
  description = "The name of the vSphere datacenter"
}

variable "vsphere_cluster" {
  type        = string
  description = "The name of the vSphere cluster"
}

variable "vsphere_datastore_cluster" {
  type        = string
  description = "The name of the vSphere datastore cluster. DRS must be enabled."
}

variable "vsphere_network" {
  type        = string
  description = "The name of the vSphere network"
}

variable "vsphere_folder" {
  type        = string
  description = "The name of the vSphere folder relative to datacenter"
}

variable "os_template" {
  type        = string
  description = "The name of the Windows template to clone"
}

variable "vm_count" {
  type        = number
  description = "The number of VMs instances to create"
}

variable "vm_annotation" {
  type        = list(string)
  description = "The notes for each vSphere virtual machine"
  default     = ["Terraform VM"]
}

variable "vm_name" {
  type        = string
  description = "The name of the vSphere virtual machines and the hostname of the machine"
}

variable "vm_cpu" {
  type        = string
  description = "Number of vCPU for the vSphere virtual machines"
}

variable "vm_cores_per_socket" {
  type        = string
  description = "Number of cores (vCPU) per socket for the vSphere virtual machines"
}

variable "vm_ram" {
  type        = string
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
}

variable "domain" {
  type        = string
  description = "Domain for DNS and AD"
}

variable "domain_admin_username" {
  type        = string
  description = "Domain account with necessary privileges to join a computer to the domain."
}

variable "domain_admin_password" {
  type        = string
  description = "Domain account password."
}

variable "dns_server_list" {
  type        = list(string)
  description = "List of DNS server IPs"
}

variable "ipv4_addresses" {
  type        = list(string)
  description = "List IPs"
}

variable "ipv4_netmasks" {
  type        = list(string)
  description = "List of net masks corresponding to the list of IPs"
}

variable "ipv4_gateways" {
  type        = list(string)
  description = "List of net gateways corresponding to the list of IPs"
}

variable "vsphere_tag_category_cc" {
  type        = string
  description = "CostCenter Tag Category"
  default     = "Centro de Costo"
}

variable "vsphere_tag_cc" {
  type        = string
  description = "CostCenter Tag"
}

variable "vsphere_tag_category_env" {
  type        = string
  description = "Environment Tag Category"
  default     = "Ambiente"
}

variable "vsphere_tag_env" {
  type        = string
  description = "Environment Tag"
}

variable "local_adminpass" {
  type        = string
  description = "admin pass local to machine"
}
