package v1alpha1

import (
	"talos.dev/v1alpha1_secrets_bundle"
)

#ClusterConfig: {
	id: string

	secret: string

	controlPlane: #ControlPlaneConfig

	network: #ClusterNetworkConfig

	token: string

	ca: v1alpha1_secrets_bundle.#PEMEncodedCertificateAndKey

	aggregatorCA?: v1alpha1_secrets_bundle.#PEMEncodedCertificateAndKey

	serviceAccount?: v1alpha1_secrets_bundle.#PEMEncodedKey

	discovery: #ClusterDiscoveryConfig
}
