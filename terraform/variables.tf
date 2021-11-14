variable "tags" {
  type = map(any)
}

variable "app" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "env" {
  type = string
}
