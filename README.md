The modules default behaviour is to deploy to Hyperflex compute cluster AC-KILB-HX-CLUS1 datacentre using the HX Datastore Cluster for storage. Leaving out 

vsphere-datacentre  = "PDC
compute-cluster     = AC-KILB-HX-CLUS1"
datastore-cluster   = "HX Datastore Cluster"
vlan                = "ACVLAN160"
template            = "terraform-template"

Here is a full module block including all variables in the variables.tf of the module. 

Optional arguments:

```
   domain               = "arnoldclark.com"
   dns_server_list      =  ["10.150.232.10", "10.150.232.15"]
   disk                 = {}
```

```
module "virtual-machine-aftersales-haproxy-southstreet" {
  source               = "../../modules/vm"
  name                 = "aftersales-haproxy02"
  domain               = "arnoldclark.com"
  ip-addr              = "10.150.233.111"
  default_gateway      = "10.150.232.1"
  folder               = "aftersales-haproxy-prd"
  dns_server_list      =  ["10.150.232.10", "10.150.232.15"]

  disk = {
    disk2 = {
        label            = "disk2"
        unit_number      = 2
        size             = 100
        thin_provisioned = true
    },
    disk3 = {
        label            = "disk3"
        unit_number      = 3
        size             = 100
        thin_provisioned = true
    }
  }

  vsphere-api-endpoint = "s000137pl.aco.arnoldclark.com"
}
```