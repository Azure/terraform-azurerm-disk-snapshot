# terraform-azurerm-disk-snapshot


## Snapshot one or more managed disks

This module helps create a disk backup by creating a snahpsot. You can also specify multiple disk names in the same resource group in a list format. 

## Usage


```hcl
module "disksnapshot" {
  source               = "Azure/disk-snapshot/azurerm"
  resource_group_name  = "resourcegroup1"
  version              = "1.0"
  managed_disk_names   = ["disk1", "disk2"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}

```

## Authors

Originally created by [Vaijanath Angadihiremath](http://github.com/VaijanathB) and [Ivan Shaporov](http://github.com/Ivan-Shaporov)



# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
