variable "region" {
  type        = string
  description = "description"
  default     = "ap-south-1"
}


variable "cidr_vpc" {
  type        = string
  description = "description"
  default     = "10.0.0.0/16"
}

variable "subpub1" {
  type        = string
  description = "description"
  default     = "10.0.1.0/24"
}

variable "subpub2" {
  type        = string
  description = "description"
  default     = "10.0.2.0/24"
}
variable "subpvt1" {
  type        = string
  description = "description"
  default     = "10.0.3.0/24"
}
variable "subpvt2" {
  type        = string
  description = "description"
  default     = "10.0.4.0/24"
}
variable "az_sub_pub1" {
  type        = string
  description = "zone"
  default     = "ap-south-1a"
}
variable "az_sub_pub2" {
  type        = string
  description = "zone"
  default     = "ap-south-1b"
}
variable "az_sub_pvt1" {
  type        = string
  description = "zone"
  default     = "ap-south-1a"
}
variable "az_sub_pvt2" {
  type        = string
  description = "zone"
  default     = "ap-south-1b"
}
variable "availability_zone_db" {
  type        = string
  description = "zone"
  default     = "ap-south-1b"
}
