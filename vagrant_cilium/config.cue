package vagrant

import (
	"talos.dev/v1alpha1"
)

config: v1alpha1.#Config & {
	machine: #MachineConfig
	cluster: #ClusterConfig
}
