output "snapshot_ids" {
  description = "The id of Snapshot resources created"
  value       = ["${azurerm_snapshot.snapshots.*.id}"]
}

# output "vnet_peer_2_id" {
#   description = "The id of the newly created virtual network peering in on second virtual netowork. "
#   value       = "${azurerm_virtual_network_peering.vnet_peer_2.id}"
# }

