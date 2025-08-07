#=======================#
# Define Variables Here #
#=======================#

variable "region" {
    default = "us-east-1"
    description = "Used to specify the region to deploy our resources to and apply to naming conventions."
}


module "web-app" {
    
    source  = "./modules/web-app"

    borrowed_bits = 5
    region        = "us-east-2"
    env           = "dev"
    org_name      = "tkdev"
    instance_type = "t3.micro"
    cidr_block    = "192.168.200.0/23"
    
    region_codes = {
        us-east-1 = "ue1"
        us-east-2 = "ue2"
        us-west-1 = "uw1"
        us-west-2 = "uw2"
    }
    
    availability_zones = {
        0 = "us-east-1a"
        1 = "us-east-1b"
    }

}
