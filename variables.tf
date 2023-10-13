variable "region" {
  default = "sa-east-1"
}

variable "int_type" {
  description = "Tipo de instancia EC2 WEB"
  type        = string
  default     = "t3.micro"
}

variable "disable_api_termination" {
  description = "Proteje a instancia contra delete acidental"
  type        = bool
  default     = true
}

variable "amis" {
  description = "Amis para determinadas regioes"
  type        = map(string)
  default = {
    "sa-east-1" = ""
    "us-east-1" = ""
  }
}
