variable "public-sub" {
  type = list(string)
  description = "Public Subnet Values"
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", ] #adjust with your requirement
}

variable "private-sub" {
  type = list(string)
  description = "Private Subnet Values"
  default = [ "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", ] #adjust with your requirement
}

variable "aws-profile" {
  description = "Enter the AWS Profile you want to use"
  type = string
}