package v1alpha1

import (
	"talos.dev/v1alpha1_secrets_bundle"
)

#EtcdConfig: {
	image: string

	ca: v1alpha1_secrets_bundle.#PEMEncodedCertificateAndKey
}
