package v1alpha1_secrets_bundle

// PEMEncodedCertificateAndKey represents a PEM encoded certificate
// and private key pair.
#PEMEncodedCertificateAndKey: {
	crt: string
	key: *"" | string
}

// PEMEncodedKey represents a PEM encoded private key.
#PEMEncodedKey: {
	key: string
}

// SecretBundle contains all cluster secrets required to generate
// machine configuration.
//
// NB: this structure is marhsalled/unmarshalled to/from JSON in
// various projects, so we need to keep representation compatible.
#SecretsBundle: {
	cluster:    #Cluster
	secrets:    #Secrets
	trustdinfo: #TrustdInfo
	certs:      #Certs
}

// Certs holds the base64 encoded keys and certificates.
#Certs: {
	// Etcd is etcd CA certificate and key.
	etcd: #PEMEncodedCertificateAndKey

	// K8s is Kubernetes CA certificate and key.
	k8s: #PEMEncodedCertificateAndKey

	// K8sAggregator is Kubernetes aggregator CA certificate and key.
	k8saggregator: #PEMEncodedCertificateAndKey

	// K8sServiceAccount is Kubernetes service account key.
	k8sserviceaccount: #PEMEncodedKey

	// OS is Talos API CA certificate and key.
	os: #PEMEncodedCertificateAndKey
}

// Cluster holds Talos cluster-wide secrets.
#Cluster: {
	id:     string
	secret: string
}

// Secrets holds the sensitive kubeadm data.
#Secrets: {
	bootstraptoken:            string
	secretboxencryptionsecret: string
}

// TrustdInfo holds the trustd credentials.
#TrustdInfo: {
	token: string
}
