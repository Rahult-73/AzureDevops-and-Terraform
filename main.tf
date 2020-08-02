provider "azurerm"{
    features{}
}
resource "azurerm_resource_group" "tf_test"{
    name="tfmaingrp"
    location="westus"
}
resource "azurerm_container_group" "tfcgtest"{
    name="weatherapi"
    location=azurerm_resource_group.tf_test.location
    resource_group_name=azurerm_resource_group.tf_test.name

    ip_address_type="public"
    dns_name_label="rahult73api"
    os_type="Linux"
    container{
        name="weatherapi"
        image="rahult73/weatherapi"
        cpu="1"
        memory="1"
        ports{
            port=80
            protocol="TCP"
        }
    }
}