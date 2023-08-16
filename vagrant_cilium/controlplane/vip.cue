package vagrant

import (
	"talos.dev/v1alpha1"
)

#MachineConfig: v1alpha1.#MachineConfig & {
	network: v1alpha1.#NetworkConfig & {
		interfaces: [
			v1alpha1.#Device & {
				interface: "eth0"
				dhcp:      true
				vip:       v1alpha1.#DeviceVIPConfig & {
					ip: "192.168.121.100"
				}
			},
		]
	}
}
