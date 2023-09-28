terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "3.71.0"
        }
        tls = {
            version = "2.1.0"
        }
        kubernetes = {
            version = "2.23.0"
        }
        null = {
            version = "3.2.1"
        }
    }
}

provider "kubernetes" {
    host = azurerm_kubernetes_cluster.cluster.kube_config[0].host
    client_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}

provider "null" {
#    version = "2.1.2"
}

