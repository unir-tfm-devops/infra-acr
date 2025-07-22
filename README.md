# Azure Container Registry Infrastructure

This repository contains Terraform configurations for managing Azure Container Registry (ACR) repositories. It provides a complete infrastructure setup for container image storage with automated lifecycle management.

## 🏗️ Infrastructure Overview

This Terraform project manages:

- **Azure Container Registry**: Container image repositories for different application templates
- **Standard SKU**: Production-ready registry with advanced features
- **Resource Group Integration**: Seamless integration with existing Azure resource groups
- **Modular Design**: Reusable ACR module for creating multiple repositories

## 📁 Project Structure

```
infra-acr/
├── main.tf                 # ACR repositories configuration
├── providers.tf            # Azure provider configuration
├── backend.tf              # Terraform backend configuration
└── modules/
    └── acr/
        ├── main.tf         # ACR repository logic
        ├── variables.tf    # Module input variables
        └── providers.tf    # Module provider configurations
```

## 🚀 Features

### ACR Repositories
- **Multiple Repositories**: Support for creating multiple ACR repositories
- **Standard SKU**: Production-ready registry with advanced features
- **Admin Access Control**: Disabled admin access for enhanced security
- **Resource Group Integration**: Uses existing resource group infrastructure

### Security Features
- **Admin Disabled**: Enhanced security with admin access disabled
- **Azure AD Integration**: Leverages Azure Active Directory for authentication
- **Resource Tagging**: Consistent tagging for resource management

## 🔧 Prerequisites

- **Terraform** >= 1.0
- **Azure CLI** configured with appropriate credentials
- **Azure Storage Backend**: Configured Azure Storage account for Terraform state storage

## 📋 Requirements

### Azure Requirements
- Azure subscription with appropriate permissions for:
  - ACR repository creation and management
  - Azure Storage account access for Terraform state
  - Resource group access and management

### Terraform Providers
- `hashicorp/azurerm` ~> 3.110.0 - Azure provider

## 🚀 Quick Start

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Review the Plan
```bash
terraform plan
```

### 3. Apply the Configuration
```bash
terraform apply
```

### 4. Access Repository URIs
After successful deployment, you can retrieve the repository URIs:
```bash
terraform output
```

## 🔐 Security Considerations

### Registry Security
- **Admin Access Disabled**: Enhanced security with admin access disabled by default
- **Azure AD Integration**: Uses Azure Active Directory for authentication
- **Standard SKU**: Production-ready features and security

### Production Security Recommendations

1. **Admin Access**: Keep admin access disabled for production environments
2. **Azure AD Integration**: Implement proper Azure AD authentication
3. **Access Control**: Configure proper RBAC permissions for repository access
4. **Network Security**: Consider implementing private endpoints for enhanced security
5. **Encryption**: Ensure encryption at rest is enabled (default for ACR)

## 🔄 Module Usage

The `modules/acr` module can be used to create additional ACR repositories:

```hcl
module "my-app-repo" {
  source = "./modules/acr"

  name = "my-application"
}
```

### Module Variables

| Variable | Type | Description | Required |
|----------|------|-------------|----------|
| `name` | string | The name of the ACR repository | Yes |

## 📊 Outputs

The ACR module provides the following outputs:

| Output | Description |
|--------|-------------|
| `login_server` | The URL of the registry |
| `id` | The ID of the registry |
| `name` | The name of the registry |

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will permanently delete all ACR repositories and their images.

## 🔧 Customization

### Repository Configuration
Modify `modules/acr/main.tf` to adjust:
- SKU settings (Basic, Standard, Premium)
- Admin access settings
- Repository tags
- Location settings

### Resource Group Integration
The module uses the existing resource group `unir-tfm-devops-rg`. To use a different resource group:
1. Modify the `resource_group_name` in `modules/acr/main.tf`
2. Ensure the resource group exists before applying

## 📝 Notes

- **State Management**: Uses Azure Storage backend for remote state storage
- **Region**: Configured for East US region
- **Project Tagging**: All resources are tagged with `Project = "unir-tfm"`
- **Resource Group**: Uses existing `unir-tfm-devops-rg` resource group
- **Storage Account**: Uses `unirtfmazurestate` storage account for Terraform state

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.