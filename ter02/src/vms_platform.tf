variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-platforms"
}

variable "vm_web_core" {
    type = string
    default = "2"
}

variable "vm_web_resources" {
  type = map(map(number))
  default = {
    "web" = { cores = 2, memory = 1, core_fraction = 5 }
    "db"  = { cores = 2, memory = 2, core_fraction = 20 }
  }
  description = "https://cloud.yandex.ru/docs/compute/concepts/performance-levels"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "https://cloud.yandex.ru/docs/compute/concepts/preemptible-vm"
}

variable "vm_web_network_interface" {
  type = object({
    #subnet_id = string
    nat = bool
  })
  default     = { "nat" = true }
  description = "Public address, access the internet over NAT."
}


variable "vm_web_metadata" {
  type = object({
    serial = number
    #ssh    = string
  })
  default = {
    serial = 1
  }
  description = "https://cloud.yandex.ru/docs/compute/concepts/vm-metadata"
}