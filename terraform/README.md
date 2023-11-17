# Terraform

Repositorio de Terraform, con:

    - Main >> archivo de configuracion general
    - Providers >> archivos con las variables 
    - Variables >> archivo donde se definen las variables sin el uso de credenciales

Primero se debe crear el archivo con las definicion de las variables llamado terraform.tfvars con el siguiente contenido:

    vsphere_server            = ""
    vsphere_username          = "usuario@"
    vsphere_password          = "xxxxxxx"
    vsphere_datacenter        = "Mitre"
    vsphere_cluster           = "CL-NoProd"
    vsphere_datastore_cluster = "DSC-NoProd"
    vsphere_network           = "LanNoProd-V8"
    vsphere_folder            = "Linux/TERRAFORM"
    os_template               = "MITLDDOC-TEMPLATE"
    vm_name                   = "MITLDTRR0"
    vm_count                  = 1
    vm_annotation             = ["Terraform VM 1","Terraform VM 2"]
    vm_cpu                    = "2"
    vm_cores_per_socket       = "2"
    vm_ram                    = "8192"
    vsphere_tag_cc            = "Estructura"
    vsphere_tag_env           = "DEV"
    domain                    = "domain"
    domain_admin_username     = "username"
    domain_admin_password     = "password"
    ipv4_addresses            = ["x.x.x.x","x.x.x.x"]
    ipv4_netmasks             = ["xx","xx"]
    ipv4_gateways             = ["x.x.x.x","x.x.x.x"]
    dns_server_list           = ["x.x.x.x","x.x.x.x"]
    local_adminpass           = "password"

Para Iniciar terraform se debe
        
        > Crear el achivo terraform.tfvars
        > Ejecutar el comando terraform init
        > Por ultimo, ejecutar terraform plan, si todo esta OK se ejecuta terraform apply
        
    
Es todo!
