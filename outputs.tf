output "instance-name" {
  value         = vsphere_virtual_machine.vm.name
  description   = "unique name of a vm created with molecule create, used to populate ansible inventory file"
}
output "instance-ip" {
  value         = vsphere_virtual_machine.vm.default_ip_address
  description   = "unique ip of a vm created with molecule create, used to populate ansible inventory file"
}
