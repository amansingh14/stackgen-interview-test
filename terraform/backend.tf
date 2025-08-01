terraform {
  backend "s3" {
    bucket = "spring-petclinic-tf-state"
    key    = "development/terraform.tfstate"
    region = "ap-south-1"
  }
}