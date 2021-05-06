variable "vsphere-datacentre" {
    default     = "PDC"
    type        = string
    description = "The datacentre in which the compute resources are housed"
}

variable "vsphere-compute" {
    default     = "PDC-PL"
    type        = string
    description = "The compute cluster with which to provision the virtual-machine"
}

// set to single datastore because PDC-PL doesn't have a storage-cluster interface
// should be "vsphere-storage-cluster" {} same as production
variable "vsphere-storage-datastore" {
    default     = "PDC_Datastore_AO_Dev01"
    type        = string
    description = "The storage backend used in lieu of resource 'vsphere-storage-cluster' {}"
}

// DEV is an existing filesystem created by the platform engineering teams 
variable "folder" {
    default     = "DEV/azure-pipeline-testing"
    type        = string
    description = "The name of the folder in which to logically place the vm."
}