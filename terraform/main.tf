data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = var.vsphere_datastore_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.os_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_tag_category" "category_cc" {
  name = var.vsphere_tag_category_cc
}

data "vsphere_tag" "tag_cc" {
  name        = var.vsphere_tag_cc
  category_id = data.vsphere_tag_category.category_cc.id
}

data "vsphere_tag_category" "category_env" {
  name = var.vsphere_tag_category_env
}

data "vsphere_tag" "tag_env" {
  name        = var.vsphere_tag_env
  category_id = data.vsphere_tag_category.category_env.id
}

#########################################################################
### RESOURCE SECTION
#########################################################################

resource "vsphere_virtual_machine" "vm" {
  count = var.vm_count

  name                       = "${var.vm_name}${count.index + 1}"
  annotation                 = var.vm_annotation[count.index]
  folder                     = "${var.vsphere_folder}"
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id       = data.vsphere_datastore_cluster.datastore_cluster.id

  num_cpus                   = var.vm_cpu
  num_cores_per_socket       = var.vm_cores_per_socket
  cpu_hot_add_enabled        = true
  cpu_hot_remove_enabled     = true
  memory                     = var.vm_ram
  memory_hot_add_enabled     = true
  guest_id                   = data.vsphere_virtual_machine.template.guest_id
  scsi_type                  = data.vsphere_virtual_machine.template.scsi_type
  wait_for_guest_net_timeout = -1

  tags = ["${data.vsphere_tag.tag_cc.id}","${data.vsphere_tag.tag_env.id}"]

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "${var.vm_name}${count.index + 1}.vmdk"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

/*
  disk {
    label             = "${var.vm_name}${count.index + 1}_1.vmdk"
    unit_number      = 1
    size             = 40
    eagerly_scrub    = false
    thin_provisioned = true
  }

  disk {
    label             = "${var.vm_name}${count.index + 1}_2.vmdk"
    unit_number      = 2
    size             = 40
    eagerly_scrub    = false
    thin_provisioned = true
  }
*/

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
/*      windows_options {
        computer_name         = "${var.vm_name}${count.index + 1}"
        #workgroup             = "WORKGROUP"
        join_domain           = var.domain
        domain_admin_user     = var.domain_admin_username
        domain_admin_password = var.domain_admin_password
        admin_password        = var.local_adminpass
        time_zone             = 70 # S.A. Eastern Standard Time
        #product_key           = var.productkey
        #organization_name     = var.orgname
        #run_once_command_list = var.run_once
        #auto_logon            = var.auto_logon
        #auto_logon_count      = var.auto_logon_count
        #full_name             = var.full_name
      }*/
    linux_options {
    	host_name = "${var.vm_name}${count.index + 1}"
	domain    = var.domain
	}
      network_interface {
        ipv4_address    = var.ipv4_addresses[count.index]
        ipv4_netmask    = var.ipv4_netmasks[count.index]
        dns_server_list = var.dns_server_list
        dns_domain      = var.domain
      }
      ipv4_gateway = var.ipv4_gateways[count.index]
      timeout = 30
    }
  }
}
