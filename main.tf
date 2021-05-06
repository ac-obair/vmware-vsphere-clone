data "vsphere_datacenter" "datacentre" {
  name = var.vsphere-datacentre
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.vsphere-compute
  datacenter_id = data.vsphere_datacenter.datacentre.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere-storage-datastore
  datacenter_id = data.vsphere_datacenter.datacentre.id
}

data "vsphere_network" "vlan" {
  name          = var.vlan
  datacenter_id = data.vsphere_datacenter.datacentre.id
}

data "vsphere_virtual_machine" "template" {
  name          = "iweb2.arnoldclark.com"
  datacenter_id = data.vsphere_datacenter.datacentre.id
}

locals {
  common-tags = {
    Terraform   = "true"
    Environment = "development"
  }
}