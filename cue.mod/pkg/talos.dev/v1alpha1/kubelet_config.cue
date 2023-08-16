package v1alpha1

#KubeletConfig: {
	image: string

	defaultRuntimeSeccompProfileEnabled: *true | bool

	disableManifestsDirectory: *true | bool
}
