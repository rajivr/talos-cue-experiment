package talosconfig

import (
	"talos.dev/v1alpha1_secrets_bundle"
	secrets_bundle "libvirt.local/secrets_bundle/controlplane:secrets_bundle"
)

cluster: v1alpha1_secrets_bundle.#Cluster & {
	id:     ""
	secret: ""
}

secrets: v1alpha1_secrets_bundle.#Secrets & {
	bootstraptoken:            ""
	secretboxencryptionsecret: ""
}

trustdinfo: v1alpha1_secrets_bundle.#TrustdInfo & {
	token: ""
}

certs: v1alpha1_secrets_bundle.#Certs & {
	etcd: crt: ""

	k8s: crt: secrets_bundle.certs.k8s.crt

	k8saggregator: crt: ""

	k8sserviceaccount: key: ""

	os: secrets_bundle.certs.os
}
