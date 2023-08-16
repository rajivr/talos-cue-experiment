package vagrant

import (
	"talos.dev/v1alpha1"
	secrets_bundle "libvirt.local/secrets_bundle/controlplane:secrets_bundle"
	"libvirt.local/endpoint"
	"libvirt.local/images"
)

#ClusterName: string & "vagrant_cilium"

#ClusterConfig: v1alpha1.#ClusterConfig & {
	id: secrets_bundle.cluster.id

	secret: secrets_bundle.cluster.secret

	controlPlane: endpoint.#ControlPlaneConfig

	clusterName: #ClusterName

	network: #ClusterNetworkConfig

	token: secrets_bundle.secrets.bootstraptoken

	secretboxEncryptionSecret: secrets_bundle.secrets.secretboxencryptionsecret

	ca: secrets_bundle.certs.k8s

	aggregatorCA: secrets_bundle.certs.k8saggregator

	serviceAccount: secrets_bundle.certs.k8sserviceaccount

	apiServer: v1alpha1.#APIServerConfig & {
		image: images.#APIServerConfig.image

		certSANs: endpoint.#APIServerConfig.certSANs
	}

	controllerManager: v1alpha1.#ControllerManagerConfig & {
		image: images.#ControllerManagerConfig.image
	}

	proxy: v1alpha1.#ProxyConfig & {
		disabled: true
	}

	scheduler: v1alpha1.#SchedulerConfig & {
		image: images.#SchedulerConfig.image
	}

	etcd: {
		image: images.#EtcdConfig.image
		ca:    secrets_bundle.certs.etcd
	}

	extraManifests: []

	inlineManifests: []
}
