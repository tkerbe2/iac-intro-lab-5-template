#                  _        _    __  
#                 (_)      | |  / _| 
#  _ __ ___   __ _ _ _ __  | |_| |_  
# | '_ ` _ \ / _` | | '_ \ | __|  _| 
# | | | | | | (_| | | | | || |_| |   
# |_| |_| |_|\__,_|_|_| |_(_)__|_|   
                                    
# Notice our main.tf is all we need to configure and our already created module does the rest. We don't need to even look at the module code.
# We simply provide the correct values to the module and run it.

#=======================#
# Define Variables Here #
#=======================#

# This is a root Global variable and we use it here because we need it for not only for the module but also for our providers.tf
variable "region" {
    default = "us-east-1"
    description = "Used to specify the region to deploy our resources to and apply to naming conventions."
}


module "web-app" {
    
# Our source is just our GitHub repo where our module code lives.
    source  = "./https://github.com:tkerbe2/iac-intro-lab-5.git"

# For this example I have used all the same variables but you can change these for your deployment. 
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
