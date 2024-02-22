variable "aws-region" {
  default = "ca-central-1"
}

variable "ami_id" {
  description = "this is for ami variable"
  default = {
    ubuntu = "ami-0a2e7efb4257c0907" 
    linux = "ami-0156b61643fdfee5c"
  }
}

variable "instance_type" {
  description = "this desc for instance type"
  default = {
    micro = "t2.micro"
    medium = "t2.medium"
  }
}

# count variable is used
/*
variable "ami_id" {
  description = "this is for ami variable"
  default = "ami-0156b61643fdfee5c" #ubuntu
  
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "aws-instance-count" {
  default = 3
}  */
