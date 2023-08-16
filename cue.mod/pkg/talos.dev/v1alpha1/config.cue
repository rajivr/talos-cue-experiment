package v1alpha1

#Config: {
	version: "v1alpha1"

	debug: *false | bool

	persist: *true | bool

	machine: #MachineConfig

	cluster: #ClusterConfig
}
