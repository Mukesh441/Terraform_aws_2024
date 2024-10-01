# Input Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"  
}

variable "environment" {
  description = "Environment variable used as prefix"
  type = string
  default = "DEV" 
  
}

variable "business_division" {
  description = "Business division in large organization"
  type = string
  default = "SAP" 
  
}


