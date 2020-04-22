variable "do_token" {

}

resource "digitalocean_ssh_key" "default" {
  name       = "Jitsi Ubuntu SSH Keys"
  public_key = "${file("/yourpath/.ssh/id_ed25519.pub")}"
}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-04-x64"
  name     = "jitsi-1"
  region   = "fra1"
  size     = "s-1vcpu-3gb"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}
