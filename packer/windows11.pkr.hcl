packer {
  required_plugins {
    azure = {
      version = ">=1.4.2"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "resource_group_name" {}
variable "location" {
  default = "EastUS"
}

source "azure-arm" "w11" {
  managed_image_name                = "windows11-managed-img"
  managed_image_resource_group_name = var.resource_group_name

  os_type = "Windows"

  image_publisher = "MicrosoftWindowsDesktop"
  image_offer     = "windows-11"
  image_sku       = "win11-23h2-pro"

  location = var.location
  vm_size  = "Standard_D2_v3"
}

build {
  name    = "win11-azure-build"
  sources = ["source.azure-arm.w11"]

  provisioner "powershell" {
    inline = [
      "Write-Host 'Installing basic components'",
      "Install-WindowsFeature Net-Framework-Core",
      "Write-Host 'Windows 11 customization complete'"
    ]
  }
}
