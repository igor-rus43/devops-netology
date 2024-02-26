#get image OS
data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}

#create two vm
resource "yandex_compute_instance" "web" {
  name        = "netology-develop-platform-web-${count.index + 1}"
  platform_id = var.vm_defaultsettings.platform_id
  count = 2
  resources {
    cores  = var.vm_defaultsettings.resources.cpu
    memory = var.vm_defaultsettings.resources.ram
    core_fraction = var.vm_defaultsettings.resources.core_fraction
##    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = var.vm_defaultsettings.disk_type
      size = var.vm_defaultsettings.disk_size
    }   
  }
  metadata = local.vm_metadata

  scheduling_policy { preemptible = true }
  
  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids  = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = true
}