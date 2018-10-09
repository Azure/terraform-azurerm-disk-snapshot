data "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
}

data "azurerm_managed_disk" "disks" {
  count               = "${length(var.managed_disk_names)}"
  name                = "${var.managed_disk_names[count.index]}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_snapshot" "snapshots" {
  count               = "${length(var.managed_disk_names)}"
  name                = "${var.managed_disk_names[count.index]}-snapshot-${replace(var.version, ".", "-")}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${var.resource_group_name}"
  create_option       = "Copy"
  source_uri          = "${element(data.azurerm_managed_disk.disks.*.id ,count.index)}"
}
