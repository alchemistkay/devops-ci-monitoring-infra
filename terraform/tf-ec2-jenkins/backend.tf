terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "k4scloud"
    workspaces {
      name = "jenkins-infra"
    }
  }
}
