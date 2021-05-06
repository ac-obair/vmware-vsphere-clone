resource "vsphere_folder" "folder" {
  path          = var.folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.datacentre.id
}