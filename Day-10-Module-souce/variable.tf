variable "ami" {
    description = "passing ami VALUE"
    type = string
    default = ""
  
}

variable "instance_type" {
    description = "passing a instance type"
    type = string
    default = ""
  
}

variable "availability_zone" {
    description = "passing az"
    type = string
    default = ""
  
}

variable "name" {
    description = "passing name for instance tag"
    type = string
    default = ""
  
}