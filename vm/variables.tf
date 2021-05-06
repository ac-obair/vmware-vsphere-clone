variable "virtual-machine-name" {
    type        = string
    description = "The host portion of the fqdn of the virtual-machine"
}

variable "domain" {
    type        = string
    default     = "arnoldclark.com"
    description = "The default domain to use for the fqdn of the virtual-machine."
}

variable "vsphere-compute" {
    type        = string
    description = "The compute cluster with which to provision the virtual-machine"
}

variable "vsphere-datacentre" {
    type        = string
    description = "The datacentre in which the compute resources are housed"
}

// set to single datastore because PDC-PL doesn't have a storage-cluster interface
// should be "vsphere-storage-cluster" {} same as production
variable "vsphere-storage-datastore" {
    default     = "PDC_Datastore_SSD_Prod01"
    type        = string
    description = "The storage backend used in lieu of resource 'vsphere-storage-cluster' {}"
}

variable "ip_address" {
    type        = string
    description = "The IP address of the vm's ens160 interface."
}

variable "vlan" {
    type        = string
    description = "The vlan in which the vnic is assigned."
}

variable "default-gateway" {
    type        = string
    description = "The default gateway of the vm."
}

// DEV is an existing filesystem created by the platform engineering teams 
variable "folder" {
    default     = "DEV/azure-pipeline-testing"
    type        = string
    description = "The name of the folder in which to logically place the vm."
}

variable "dns-server-list" {
    type        = list
    default     = ["10.150.232.10","10.150.232.15"]
    description = "A list of valid dns resolvers."
}
