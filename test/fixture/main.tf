resource "random_id" "rg_name" {
  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  name     = "${random_id.rg_name.hex}"
  location = "${var.location}"
}

resource "azurerm_managed_disk" "test" {
  count                = 2
  name                 = "disk-${count.index}"
  location             = "${var.location}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
}

module "disksnapshot" {
  source              = "../../"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  version             = "1.0"
  managed_disk_names  = ["disk-0", "disk-1"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
