## Service Principal

[Guide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)

1. In order to terraform let access the azure account, a SP has to be created
2. On Azure portal Create SP under Microsoft Entra ID and generate SecretKey 
3. Attach this SP to the Azure Subscription and provide contributor access
4. Export env var specified in .env.tmpl in the terminal
5. terraform init -> terraform validate -> terraform apply
6. To delete the resources use `terraform destroy`
7. Configure Remote Backend on [Azure](https://developer.hashicorp.com/terraform/language/backend/azurerm)