variable "region" {
  description = "Define what region the instance will be deployed / Região do deploy"
  default     = "us-east-1"
}

variable "name" {
  description = "Name of the application / Nome da aplicação"
  default     = "server01"
}

variable "env" {
  description = "Environment of the application / Ambiente que a aplicação sera executada"
  default     = "prod"
}

variable "ami" {
  description = "AWS AMI to be used / Imagem a ser utilizada"
  default     = "ami-042e8287309f5df03"
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repositor of the application"
  default     = "github/"
}
