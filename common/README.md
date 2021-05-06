
There's a bit of a chicken and egg scenario with the terraform-remote-state blobs. Since we're intialising state to be stored in a blob `key = "terraform-remote-state"` that doesn't exist yet, in the terraform that's supposed to create it. 

The container was therefore created manually, and the state imported. 