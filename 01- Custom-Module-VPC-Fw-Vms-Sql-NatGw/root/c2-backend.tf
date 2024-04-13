# Adding Backend as S3 for Remote State Storage
terraform {
  backend "gcs" {
    bucket = "aslam-tf-bucket-state"
    prefix = "prod/vpc-moduler-state"
  }
}