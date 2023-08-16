package v1alpha1

import (
	"talos.dev/v1alpha1_secrets_bundle"
)

#MachineConfig: {
	type: "controlplane" | "worker"

	token: string

	ca: v1alpha1_secrets_bundle.#PEMEncodedCertificateAndKey

	certSANs: *[] | [...string]

	kubelet: #KubeletConfig

	network: {} | #NetworkConfig

	install: #InstallConfig

	registries: {} | #RegistriesConfig

	features: #FeaturesConfig
}
