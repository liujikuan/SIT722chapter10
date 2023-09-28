terraform {
#     Uncomment this to get it running in the CD pipeline.
     backend "azurerm" {
         resource_group_name  = "flixtube"
         storage_account_name = "flixtubestore1"
         container_name       = "terrastore"
         key                  = "terraform.tfstate"
#        access_key =
     }
}