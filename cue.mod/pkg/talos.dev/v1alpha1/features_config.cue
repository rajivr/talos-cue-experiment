package v1alpha1

#FeaturesConfig: {
	rbac: *true | bool

	stableHostname: *true | bool

	apidCheckExtKeyUsage: *true | bool

	// `diskQuotaSupport` is not available in `v1.5-alpha.1`. Since we
	// have currently reverted back to `v1.5-alpha.0`, comment the
	// following for now till the flannel issue gets fixed.
	// diskQuotaSupport: *true | bool
}
