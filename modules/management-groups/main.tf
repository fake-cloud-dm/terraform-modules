resource "azurerm_management_group" "root" {
  display_name = var.customer_name
  name         = lower(replace(var.customer_name, " ", "-"))

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  name                       = "platform"
  parent_management_group_id = azurerm_management_group.root.id

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "landing-zones" {
  display_name               = "Landing Zones"
  name                       = "landing-zones"
  parent_management_group_id = azurerm_management_group.root.id

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "connectivity" {
  display_name               = "Connectivity"
  name                       = "connectivity"
  parent_management_group_id = azurerm_management_group.platform.id

  subscription_ids = [
    var.hub_subscription_id,
  ]

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "management" {
  display_name               = "Management"
  name                       = "management"
  parent_management_group_id = azurerm_management_group.platform.id

  subscription_ids = [
    var.mgmt_subscription_id,
  ]

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "identity" {
  display_name               = "Identity"
  name                       = "identity"
  parent_management_group_id = azurerm_management_group.platform.id

  subscription_ids = [
    var.id_subscription_id,
  ]

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_management_group" "corp" {
  display_name               = "Corp"
  name                       = "corp"
  parent_management_group_id = azurerm_management_group.landing-zones.id

  subscription_ids = concat(
    [var.prod_subscription_id],
    var.dev_subscription_id,
    var.uat_subscription_id
  )
}
