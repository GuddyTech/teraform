variable "defauversion" {
  description = "default template version"
  type        = string
  default     = "1"
}
variable "public_ip" {
  description = "launch template public ip"
  type        = bool
  default     = true
}

variable "description" {
  description = "description for update"
  type        = string
  default     = "this is the beginning of games server's life"
}
variable "image_id" {
  description = "id of ami"
  type        = string
  default     = "ami-087de15a22879b9ef"
  # "ami-0127b2e6f3b9b94d5"
}
variable "vpc_security_group_ids" {
  description = "vpc security group id"
  type        = list(string)
  default     = ["sg-0e0a79ce1d251f8ab"]
}
variable "user_data" {
  description = "instance start up script. Should be base64 encoded"
  type        = string
  default     = ""
}
variable "instance_market_options" {
  description = "instance start up script. Should be base64 encoded"
  type        = string
  default     = "spot"
}
variable "iam_instance_profile_arn" {
  description = "instance iam role"
  type        = string
  default     = ""
}
variable "block_device_mappings_ebs" {
  type = map(any)
  default = {
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "30"
    volume_type           = "gp3"
  }

}
variable "name" {
  description = "launch template name"
  type        = string
  default     = "games"
}
variable "key_name" {
  description = "launch template key pair name"
  type        = string
  default     = "rsc-rand"
}
variable "user_data_base64" {
  description = "launch template user data"
  type        = string
  //TODO: think about a better way to manage which ecs cluster a launch template is associated
  // with - something more solid than user data or something more dynamic than a variable
  default = "IyEvYmluL2Jhc2gKY2F0IDw8J0VPRicgPj4gL2V0Yy9lY3MvZWNzLmNvbmZpZwpFQ1NfQ0xVU1RFUj1nYW1lcwpFQ1NfRU5BQkxFX1NQT1RfSU5TVEFOQ0VfRFJBSU5JTkc9dHJ1ZQpFQ1NfQ09OVEFJTkVSX0lOU1RBTkNFX1BST1BBR0FURV9UQUdTX0ZST009ZWMyX2luc3RhbmNlCkVPRg=="
}
variable "default_version" {
  default = "1"
  type = string
}
variable "instance_type" {
    default = "t2.micro"
}
