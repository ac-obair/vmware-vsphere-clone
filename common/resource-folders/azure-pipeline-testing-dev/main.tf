provider "vsphere" {
  vsphere_server = "s000126pl.aco.arnoldclark.com"
  // If you have a self-signed cert
  allow_unverified_ssl = true
}

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

terraform {
  backend "azurerm" {
    storage_account_name = "actfstate"
    container_name       = "ac-iac-platform-on-premises"
    key                  = "dev/azure-pipeline-testing"
  }
}

locals {
  common-tags = {
    Terraform   = "true"
    Environment = "development"
  }
}