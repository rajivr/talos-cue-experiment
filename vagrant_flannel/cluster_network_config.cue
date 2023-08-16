package vagrant

import (
	"talos.dev/v1alpha1"
)

#ClusterNetworkConfig: v1alpha1.#ClusterNetworkConfig & {
	dnsDomain: "cluster.local"
	podSubnets: [
		"10.244.0.0/16",
	]
	serviceSubnets: [
		"10.96.0.0/12",
	]
}
