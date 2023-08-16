package secrets_bundle

import (
	"talos.dev/v1alpha1_secrets_bundle"
)

cluster: v1alpha1_secrets_bundle.#Cluster

secrets: v1alpha1_secrets_bundle.#Secrets

trustdinfo: v1alpha1_secrets_bundle.#TrustdInfo

certs: v1alpha1_secrets_bundle.#Certs
