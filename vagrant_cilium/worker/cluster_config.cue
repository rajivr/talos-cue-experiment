package vagrant

import (
	"talos.dev/v1alpha1"
	secrets_bundle "libvirt.local/secrets_bundle/worker:secrets_bundle"
	"libvirt.local/endpoint"
)

#ClusterConfig: v1alpha1.#ClusterConfig & {
	id: secrets_bundle.cluster.id

	secret: secrets_bundle.cluster.secret

	controlPlane: endpoint.#ControlPlaneConfig

	network: #ClusterNetworkConfig

	token: secrets_bundle.secrets.bootstraptoken

	ca: secrets_bundle.certs.k8s
}
