package vagrant

import (
	"talos.dev/v1alpha1"
	secrets_bundle "libvirt.local/secrets_bundle/worker:secrets_bundle"
	"libvirt.local/images"
)

#MachineConfig: v1alpha1.#MachineConfig & {
	type: "worker"

	token: secrets_bundle.trustdinfo.token

	ca: secrets_bundle.certs.os

	kubelet: image: images.#KubeletConfig.image

	install: {
		disk: "/dev/vda"

		image: images.#InstallConfig.image
	}
}
