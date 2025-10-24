packer {
  required_version = ">= 1.9.0"

  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = ">= 2.0.0"
    }
  }
}

source "azure-arm" "win11" {
  client_id         = var.client_id
  client_secret     = var.client_secret
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id

  use_azure_cli_auth = false
  location           = var.location
  vm_size            = var.vm_size

  managed_image_resource_group_name = var.resource_group_name
  managed_image_name                = "${var.vm_name}-image"

  os_type = "Windows"

  # Networking using existing VNet & Subnet
  virtual_network_name                = var.vnet_name
  virtual_network_resource_group_name = var.pl_resource_group_name
  subnet_name                         = var.subnet_name
  private_virtual_network_with_public_ip = false

  # Source: Windows 11 Pro 22H2
  image_publisher = "MicrosoftWindowsDesktop"
  image_offer     = "windows11"
  image_sku       = "win11-22h2-pro"
  image_version   = "latest"

  communicator   = "winrm"
  winrm_insecure = true
  winrm_username = var.admin_username
}

build {
  name    = "windows11-image-build"
  sources = ["source.azure-arm.win11"]
}
