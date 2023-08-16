package vagrant

import (
	"talos.dev/v1alpha1"
)

#CNIConfig: v1alpha1.#CNIConfig & {
	name: "none"
}

#ClusterNetworkConfig: v1alpha1.#ClusterNetworkConfig & {
	cni: #CNIConfig

	dnsDomain: "cluster.local"

	podSubnets: [
		"10.244.0.0/16",
	]

	serviceSubnets: [
		"10.96.0.0/12",
	]
}
