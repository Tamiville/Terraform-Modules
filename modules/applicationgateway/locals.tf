locals {
  # Common tags to be assigned to all resources
  appgw_tags = {
    Department  = "Devops"
    Owner       = "Tamiville"
    ManagedWith = "Terraform"
    company     = "EliteSolutions LLC"
    service     = "Elite Technology Service"
  }

  rgappw          = "elite"
  buildregion     = lower("CENTRALUS")
  existingvnet    = "elitedev_vnet"
  existingvnetrg  = "elite-vnetdevrg"
  existingnsg     = "nsgrule-ssh"
  existingrtb     = "elite_rtb"
  ipconfname      = "internal"
  ssl_certificate = "elitelabtoolsazure.link"
}