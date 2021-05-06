resource "vsphere_virtual_machine" "vm" {
  name             = var.virtual-machine-name
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  // folder path is relative which data block path is absolute
  folder           = trimprefix(data.vsphere_folder.folder.path, "/PDC/vm")


  num_cpus = 2
  cpu_hot_add_enabled = true 
  cpu_hot_remove_enabled = true
  memory   = 2048
  memory_hot_add_enabled = true

  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.vlan.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types.0
  }

  disk {
    label            = "disk0"
    unit_number      = 0
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.virtual-machine-name
        domain    = var.domain
      }

      network_interface {
        ipv4_address = var.ip_address
        ipv4_netmask = 24
      }

      ipv4_gateway = var.default-gateway
      dns_server_list = var.dns-server-list

    }
  }
}