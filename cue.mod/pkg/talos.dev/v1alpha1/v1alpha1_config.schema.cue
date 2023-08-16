package v1alpha1

@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
#Config & {
	@jsonschema(id="https://talos.dev/v1.5/schemas/v1alpha1_config.schema.json")
	...
}

#APIServerBalancer: {
	// enabled
	//
	// Enable API server load balancer support - will start local
	// proxy.
	enabled?: bool

	// port
	//
	// API server load balancer port.
	port?: int
}

#APIServerConfig: {
	// image
	//
	// The container image used in the API server manifest.
	image?: string

	// extraArgs
	//
	// Extra arguments to supply to the API server.
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// extraVolumes
	//
	// Extra volumes to mount to the API server static pod.
	extraVolumes?: [...#VolumeMountConfig]

	// env
	//
	// The env field allows for the addition of environment variables
	// for the control plane component.
	env?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// certSANs
	//
	// Extra certificate subject alternative names for the API
	// server’s certificate.
	certSANs?: [...string]

	// disablePodSecurityPolicy
	//
	// Disable PodSecurityPolicy in the API server and default
	// manifests.
	disablePodSecurityPolicy?: bool

	// admissionControl
	//
	// Configure the API server admission plugins.
	admissionControl?: [...#AdmissionPluginConfig]

	// auditPolicy
	//
	// Configure the API server audit policy.
	auditPolicy?: {
		...
	}
}

#AdminKubeconfigConfig: {
	// certLifetime
	//
	// Admin kubeconfig certificate lifetime (default is 1 year).
	// Field format accepts any Go time.Duration format (‘1h’ for one
	// hour, ‘10m’ for ten minutes).
	certLifetime?: =~"^[-+]?(((\\d+(\\.\\d*)?|\\d*(\\.\\d+)+)([nuµm]?s|m|h))|0)+$"
}

#AdmissionPluginConfig: {
	// name
	//
	// Name is the name of the admission controller.
	// It must match the registered admission plugin name.
	name?: string

	// configuration
	//
	// Configuration is an embedded configuration object to be used as
	// the plugin’s
	// configuration.
	configuration?: {
		...
	}
}

#Bond: {
	// interfaces
	//
	// The interfaces that make up the bond.
	interfaces?: [...string]

	// deviceSelectors
	//
	// Picks a network device using the selector.
	// Mutually exclusive with interfaces.
	// Supports partial match using wildcard syntax.
	deviceSelectors?: [...#NetworkDeviceSelector]

	// arpIPTarget
	//
	// A bond option.
	// Please see the official kernel documentation.
	// Not supported at the moment.
	arpIPTarget?: [...string]

	// mode
	//
	// A bond option.
	// Please see the official kernel documentation.
	mode?: string

	// xmitHashPolicy
	//
	// A bond option.
	// Please see the official kernel documentation.
	xmitHashPolicy?: string

	// lacpRate
	//
	// A bond option.
	// Please see the official kernel documentation.
	lacpRate?: string

	// adActorSystem
	//
	// A bond option.
	// Please see the official kernel documentation.
	// Not supported at the moment.
	adActorSystem?: string

	// arpValidate
	//
	// A bond option.
	// Please see the official kernel documentation.
	arpValidate?: string

	// arpAllTargets
	//
	// A bond option.
	// Please see the official kernel documentation.
	arpAllTargets?: string

	// primary
	//
	// A bond option.
	// Please see the official kernel documentation.
	primary?: string

	// primaryReselect
	//
	// A bond option.
	// Please see the official kernel documentation.
	primaryReselect?: string

	// failOverMac
	//
	// A bond option.
	// Please see the official kernel documentation.
	failOverMac?: string

	// adSelect
	//
	// A bond option.
	// Please see the official kernel documentation.
	adSelect?: string

	// miimon
	//
	// A bond option.
	// Please see the official kernel documentation.
	miimon?: int

	// updelay
	//
	// A bond option.
	// Please see the official kernel documentation.
	updelay?: int

	// downdelay
	//
	// A bond option.
	// Please see the official kernel documentation.
	downdelay?: int

	// arpInterval
	//
	// A bond option.
	// Please see the official kernel documentation.
	arpInterval?: int

	// resendIgmp
	//
	// A bond option.
	// Please see the official kernel documentation.
	resendIgmp?: int

	// minLinks
	//
	// A bond option.
	// Please see the official kernel documentation.
	minLinks?: int

	// lpInterval
	//
	// A bond option.
	// Please see the official kernel documentation.
	lpInterval?: int

	// packetsPerSlave
	//
	// A bond option.
	// Please see the official kernel documentation.
	packetsPerSlave?: int

	// numPeerNotif
	//
	// A bond option.
	// Please see the official kernel documentation.
	numPeerNotif?: int

	// tlbDynamicLb
	//
	// A bond option.
	// Please see the official kernel documentation.
	tlbDynamicLb?: int

	// allSlavesActive
	//
	// A bond option.
	// Please see the official kernel documentation.
	allSlavesActive?: int

	// useCarrier
	//
	// A bond option.
	// Please see the official kernel documentation.
	useCarrier?: bool

	// adActorSysPrio
	//
	// A bond option.
	// Please see the official kernel documentation.
	adActorSysPrio?: int

	// adUserPortKey
	//
	// A bond option.
	// Please see the official kernel documentation.
	adUserPortKey?: int

	// peerNotifyDelay
	//
	// A bond option.
	// Please see the official kernel documentation.
	peerNotifyDelay?: int
}

#Bridge: {
	// interfaces
	//
	// The interfaces that make up the bridge.
	interfaces?: [...string]

	// stp
	//
	// A bridge option.
	// Please see the official kernel documentation.
	stp?: #STP
}

#CNIConfig: {
	// name
	//
	// Name of CNI to use.
	name?: "flannel" | "custom" | "none"

	// urls
	//
	// URLs containing manifests to apply for the CNI.
	// Should be present for “custom”, must be empty for “flannel” and
	// “none”.
	urls?: [...string]
}

#ClusterConfig: {
	// id
	//
	// Globally unique identifier for this cluster (base64 encoded
	// random 32 bytes).
	id?: string

	// secret
	//
	// Shared secret of cluster (base64 encoded random 32 bytes).
	// This secret is shared among cluster members but should never be
	// sent over the network.
	secret?: string

	// controlPlane
	//
	// Provides control plane specific configuration options.
	controlPlane?: #ControlPlaneConfig

	// clusterName
	//
	// Configures the cluster’s name.
	clusterName?: string

	// network
	//
	// Provides cluster specific network configuration options.
	network?: #ClusterNetworkConfig

	// token
	//
	// The bootstrap token used to join the cluster.
	token?: string

	// aescbcEncryptionSecret
	//
	// A key used for the encryption of secret data at rest.
	// Enables encryption with AESCBC.
	aescbcEncryptionSecret?: string

	// secretboxEncryptionSecret
	//
	// A key used for the encryption of secret data at rest.
	// Enables encryption with secretbox.
	// Secretbox has precedence over AESCBC.
	secretboxEncryptionSecret?: string

	// ca
	//
	// The base64 encoded root certificate authority used by
	// Kubernetes.
	ca?: {
		crt?: string
		key?: string
	}

	// aggregatorCA
	//
	// The base64 encoded aggregator certificate authority used by
	// Kubernetes for front-proxy certificate generation.
	//
	// This CA can be self-signed.
	aggregatorCA?: {
		crt?: string
		key?: string
	}

	// serviceAccount
	//
	// The base64 encoded private key for service account token
	// generation.
	serviceAccount?: {
		key?: string
	}

	// apiServer
	//
	// API server specific configuration options.
	apiServer?: #APIServerConfig

	// controllerManager
	//
	// Controller manager server specific configuration options.
	controllerManager?: #ControllerManagerConfig

	// proxy
	//
	// Kube-proxy server-specific configuration options
	proxy?: #ProxyConfig

	// scheduler
	//
	// Scheduler server specific configuration options.
	scheduler?: #SchedulerConfig

	// discovery
	//
	// Configures cluster member discovery.
	discovery?: #ClusterDiscoveryConfig

	// etcd
	//
	// Etcd specific configuration options.
	etcd?: #EtcdConfig

	// coreDNS
	//
	// Core DNS specific configuration options.
	coreDNS?: #CoreDNS

	// externalCloudProvider
	//
	// External cloud provider configuration.
	externalCloudProvider?: #ExternalCloudProviderConfig

	// extraManifests
	//
	// A list of urls that point to additional manifests.
	// These will get automatically deployed as part of the bootstrap.
	extraManifests?: [...string]

	// extraManifestHeaders
	//
	// A map of key value pairs that will be added while fetching the
	// extraManifests.
	extraManifestHeaders?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// inlineManifests
	//
	// A list of inline Kubernetes manifests.
	// These will get automatically deployed as part of the bootstrap.
	inlineManifests?: [...#ClusterInlineManifest]

	// adminKubeconfig
	//
	// Settings for admin kubeconfig generation.
	// Certificate lifetime can be configured.
	adminKubeconfig?: #AdminKubeconfigConfig

	// allowSchedulingOnControlPlanes
	//
	// Allows running workload on control-plane nodes.
	allowSchedulingOnControlPlanes?: bool
}

#ClusterDiscoveryConfig: {
	// enabled
	//
	// Enable the cluster membership discovery feature.
	// Cluster discovery is based on individual registries which are
	// configured under the registries field.
	enabled?: bool

	// registries
	//
	// Configure registries used for cluster member discovery.
	registries?: #DiscoveryRegistriesConfig
}

#ClusterInlineManifest: {
	// name
	//
	// Name of the manifest.
	// Name should be unique.
	name?: string

	// contents
	//
	// Manifest contents as a string.
	contents?: string
}

#ClusterNetworkConfig: {
	// cni
	//
	// The CNI used.
	// Composed of “name” and “urls”.
	// The “name” key supports the following options: “flannel”,
	// “custom”, and “none”.
	// “flannel” uses Talos-managed Flannel CNI, and that’s the
	// default option.
	// “custom” uses custom manifests that should be provided in
	// “urls”.
	// “none” indicates that Talos will not manage any CNI
	// installation.
	cni?: #CNIConfig

	// dnsDomain
	//
	// The domain used by Kubernetes DNS.
	// The default is cluster.local
	dnsDomain?: string

	// podSubnets
	//
	// The pod subnet CIDR.
	podSubnets?: [...string]

	// serviceSubnets
	//
	// The service subnet CIDR.
	serviceSubnets?: [...string]
}

#Config: {
	// version
	//
	// Indicates the schema used to decode the contents.
	version?: "v1alpha1"

	// debug
	//
	// Enable verbose logging to the console.
	// All system containers logs will flow into serial console.
	//
	// Note: To avoid breaking Talos bootstrap flow enable this option
	// only if serial console can handle high message throughput.
	debug?: bool

	// persist
	//
	// Indicates whether to pull the machine config upon every boot.
	persist?: bool

	// machine
	//
	// Provides machine specific configuration options.
	machine?: #MachineConfig

	// cluster
	//
	// Provides cluster specific configuration options.
	cluster?: #ClusterConfig
}

#ControlPlaneConfig: {
	// endpoint
	//
	// Endpoint is the canonical controlplane endpoint, which can be
	// an IP address or a DNS hostname.
	// It is single-valued, and may optionally include a port number.
	endpoint?: =~"^https://"

	// localAPIServerPort
	//
	// The port that the API server listens on internally.
	// This may be different than the port portion listed in the
	// endpoint field above.
	// The default is 6443.
	localAPIServerPort?: int
}

#ControllerManagerConfig: {
	// image
	//
	// The container image used in the controller manager manifest.
	image?: string

	// extraArgs
	//
	// Extra arguments to supply to the controller manager.
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// extraVolumes
	//
	// Extra volumes to mount to the controller manager static pod.
	extraVolumes?: [...#VolumeMountConfig]

	// env
	//
	// The env field allows for the addition of environment variables
	// for the control plane component.
	env?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}
}

#CoreDNS: {
	// disabled
	//
	// Disable coredns deployment on cluster bootstrap.
	disabled?: bool

	// image
	//
	// The image field is an override to the default coredns image.
	image?: string
}

#DHCPOptions: {
	// routeMetric
	//
	// The priority of all routes received via DHCP.
	routeMetric?: int

	// ipv4
	//
	// Enables DHCPv4 protocol for the interface (default is enabled).
	ipv4?: bool

	// ipv6
	//
	// Enables DHCPv6 protocol for the interface (default is
	// disabled).
	ipv6?: bool

	// duidv6
	//
	// Set client DUID (hex string).
	duidv6?: string
}

#Device: {
	// interface
	//
	// The interface name.
	// Mutually exclusive with deviceSelector.
	interface?: string

	// deviceSelector
	//
	// Picks a network device using the selector.
	// Mutually exclusive with interface.
	// Supports partial match using wildcard syntax.
	deviceSelector?: #NetworkDeviceSelector

	// addresses
	//
	// Assigns static IP addresses to the interface.
	// An address can be specified either in proper CIDR notation or
	// as a standalone address (netmask of all ones is assumed).
	addresses?: [...string]

	// routes
	//
	// A list of routes associated with the interface.
	// If used in combination with DHCP, these routes will be appended
	// to routes returned by DHCP server.
	routes?: [...#Route]

	// bond
	//
	// Bond specific options.
	bond?: #Bond

	// bridge
	//
	// Bridge specific options.
	bridge?: #Bridge

	// vlans
	//
	// VLAN specific options.
	vlans?: [...#Vlan]

	// mtu
	//
	// The interface’s MTU.
	// If used in combination with DHCP, this will override any MTU
	// settings returned from DHCP server.
	mtu?: int

	// dhcp
	//
	// Indicates if DHCP should be used to configure the interface.
	// The following DHCP options are supported:
	//
	//
	// OptionClasslessStaticRoute
	// OptionDomainNameServer
	// OptionDNSDomainSearchList
	// OptionHostName
	dhcp?: bool

	// ignore
	//
	// Indicates if the interface should be ignored (skips
	// configuration).
	ignore?: bool

	// dummy
	//
	// Indicates if the interface is a dummy interface.
	// dummy is used to specify that this interface should be a
	// virtual-only, dummy interface.
	dummy?: bool

	// dhcpOptions
	//
	// DHCP specific options.
	// dhcp must be set to true for these to take effect.
	dhcpOptions?: #DHCPOptions

	// wireguard
	//
	// Wireguard specific configuration.
	// Includes things like private key, listen port, peers.
	wireguard?: #DeviceWireguardConfig

	// vip
	//
	// Virtual (shared) IP address configuration.
	vip?: #DeviceVIPConfig
}

#DeviceVIPConfig: {
	// ip
	//
	// Specifies the IP address to be used.
	ip?: string

	// equinixMetal
	//
	// Specifies the Equinix Metal API settings to assign VIP to the
	// node.
	equinixMetal?: #VIPEquinixMetalConfig

	// hcloud
	//
	// Specifies the Hetzner Cloud API settings to assign VIP to the
	// node.
	hcloud?: #VIPHCloudConfig
}

#DeviceWireguardConfig: {
	// privateKey
	//
	// Specifies a private key configuration (base64 encoded).
	// Can be generated by wg genkey.
	privateKey?: string

	// listenPort
	//
	// Specifies a device’s listening port.
	listenPort?: int

	// firewallMark
	//
	// Specifies a device’s firewall mark.
	firewallMark?: int

	// peers
	//
	// Specifies a list of peer configurations to apply to a device.
	peers?: [...#DeviceWireguardPeer]
}

#DeviceWireguardPeer: {
	// publicKey
	//
	// Specifies the public key of this peer.
	// Can be extracted from private key by running wg pubkey &lt;
	// private.key &gt; public.key &amp;&amp; cat public.key.
	publicKey?: string

	// endpoint
	//
	// Specifies the endpoint of this peer entry.
	endpoint?: string

	// persistentKeepaliveInterval
	//
	// Specifies the persistent keepalive interval for this peer.
	// Field format accepts any Go time.Duration format (‘1h’ for one
	// hour, ‘10m’ for ten minutes).
	persistentKeepaliveInterval?: =~"^[-+]?(((\\d+(\\.\\d*)?|\\d*(\\.\\d+)+)([nuµm]?s|m|h))|0)+$"

	// allowedIPs
	//
	// AllowedIPs specifies a list of allowed IP addresses in CIDR
	// notation for this peer.
	allowedIPs?: [...string]
}

#DiscoveryRegistriesConfig: {
	// kubernetes
	//
	// Kubernetes registry uses Kubernetes API server to discover
	// cluster members and stores additional information
	// as annotations on the Node resources.
	kubernetes?: #RegistryKubernetesConfig

	// service
	//
	// Service registry is using an external service to push and pull
	// information about cluster members.
	service?: #RegistryServiceConfig
}

#DiskPartition: {
	// size
	//
	// The size of partition: either bytes or human readable
	// representation. If size: is omitted, the partition is sized to
	// occupy the full disk.
	size?: int

	// mountpoint
	//
	// Where to mount the partition.
	mountpoint?: string
}

#EncryptionConfig: {
	// provider
	//
	// Encryption provider to use for the encryption.
	provider?: string

	// keys
	//
	// Defines the encryption keys generation and storage method.
	keys?: [...#EncryptionKey]

	// cipher
	//
	// Cipher kind to use for the encryption. Depends on the
	// encryption provider.
	cipher?: "aes-xts-plain64" | "xchacha12,aes-adiantum-plain64" | "xchacha20,aes-adiantum-plain64"

	// keySize
	//
	// Defines the encryption key length.
	keySize?: int

	// blockSize
	//
	// Defines the encryption sector size.
	blockSize?: int

	// options
	//
	// Additional –perf parameters for the LUKS2 encryption.
	options?: "no_read_workqueue" | "no_write_workqueue" | "same_cpu_crypt"
}

#EncryptionKey: {
	// static
	//
	// Key which value is stored in the configuration file.
	static?: #EncryptionKeyStatic

	// nodeID
	//
	// Deterministically generated key from the node UUID and
	// PartitionLabel.
	nodeID?: #EncryptionKeyNodeID

	// slot
	//
	// Key slot number for LUKS2 encryption.
	slot?: int
}

#EncryptionKeyNodeID: {}

#EncryptionKeyStatic: {
	// passphrase
	//
	// Defines the static passphrase value.
	passphrase?: string
}

#Endpoint: {}

#EtcdConfig: {
	// image
	//
	// The container image used to create the etcd service.
	image?: string

	// ca
	//
	// The ca is the root certificate authority of the PKI.
	// It is composed of a base64 encoded crt and key.
	ca?: {
		crt?: string
		key?: string
	}

	// extraArgs
	//
	// Extra arguments to supply to etcd.
	// Note that the following args are not allowed:
	//
	//
	// name
	// data-dir
	// initial-cluster-state
	// listen-peer-urls
	// listen-client-urls
	// cert-file
	// key-file
	// trusted-ca-file
	// peer-client-cert-auth
	// peer-cert-file
	// peer-trusted-ca-file
	// peer-key-file
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// advertisedSubnets
	//
	// The advertisedSubnets field configures the networks to pick
	// etcd advertised IP from.
	//
	// IPs can be excluded from the list by using negative match with
	// !, e.g !10.0.0.0/8.
	// Negative subnet matches should be specified last to filter out
	// IPs picked by positive matches.
	// If not specified, advertised IP is selected as the first
	// routable address of the node.
	advertisedSubnets?: [...string]

	// listenSubnets
	//
	// The listenSubnets field configures the networks for the etcd to
	// listen for peer and client connections.
	//
	// If listenSubnets is not set, but advertisedSubnets is set,
	// listenSubnets defaults to
	// advertisedSubnets.
	//
	// If neither advertisedSubnets nor listenSubnets is set,
	// listenSubnets defaults to listen on all addresses.
	//
	// IPs can be excluded from the list by using negative match with
	// !, e.g !10.0.0.0/8.
	// Negative subnet matches should be specified last to filter out
	// IPs picked by positive matches.
	// If not specified, advertised IP is selected as the first
	// routable address of the node.
	listenSubnets?: [...string]
}

#ExternalCloudProviderConfig: {
	// enabled
	//
	// Enable external cloud provider.
	enabled?: bool

	// manifests
	//
	// A list of urls that point to additional manifests for an
	// external cloud provider.
	// These will get automatically deployed as part of the bootstrap.
	manifests?: [...string]
}

#ExtraHost: {
	// ip
	//
	// The IP of the host.
	ip?: string

	// aliases
	//
	// The host alias.
	aliases?: [...string]
}

#ExtraMount: {}

#FeaturesConfig: {
	// rbac
	//
	// Enable role-based access control (RBAC).
	rbac?: bool

	// stableHostname
	//
	// Enable stable default hostname.
	stableHostname?: bool

	// kubernetesTalosAPIAccess
	//
	// Configure Talos API access from Kubernetes pods.
	//
	// This feature is disabled if the feature config is not
	// specified.
	kubernetesTalosAPIAccess?: #KubernetesTalosAPIAccessConfig

	// apidCheckExtKeyUsage
	//
	// Enable checks for extended key usage of client certificates in
	// apid.
	apidCheckExtKeyUsage?: bool

	// diskQuotaSupport
	//
	// Enable XFS project quota support for EPHEMERAL partition and
	// user disks.
	// Also enables kubelet tracking of ephemeral disk usage in the
	// kubelet via quota.
	diskQuotaSupport?: bool

	// apiServerBalancerSupport
	//
	// API server load balancer support - local proxy on defined port
	// that will distribute
	// requests to all API servers in the cluster.
	apiServerBalancerSupport?: #APIServerBalancer
}

#InstallConfig: {
	// disk
	//
	// The disk used for installations.
	disk?: string

	// diskSelector
	//
	// Look up disk using disk attributes like model, size, serial and
	// others.
	// Always has priority over disk.
	diskSelector?: #InstallDiskSelector

	// extraKernelArgs
	//
	// Allows for supplying extra kernel args via the bootloader.
	extraKernelArgs?: [...string]

	// image
	//
	// Allows for supplying the image used to perform the
	// installation.
	// Image reference for each Talos release can be found on
	// GitHub releases page.
	image?: string

	// extensions
	//
	// Allows for supplying additional system extension images to
	// install on top of base Talos image.
	extensions?: [...#InstallExtensionConfig]

	// bootloader
	//
	// Indicates if a bootloader should be installed.
	bootloader?: bool

	// wipe
	//
	// Indicates if the installation disk should be wiped at
	// installation time.
	// Defaults to true.
	wipe?: bool

	// legacyBIOSSupport
	//
	// Indicates if MBR partition should be marked as bootable
	// (active).
	// Should be enabled only for the systems with legacy BIOS that
	// doesn’t support GPT partitioning scheme.
	legacyBIOSSupport?: bool
}

#InstallDiskSelector: {
	// size
	//
	// Disk size.
	size?: string

	// name
	//
	// Disk name /sys/block/&lt;dev&gt;/device/name.
	name?: string

	// model
	//
	// Disk model /sys/block/&lt;dev&gt;/device/model.
	model?: string

	// serial
	//
	// Disk serial number /sys/block/&lt;dev&gt;/serial.
	serial?: string

	// modalias
	//
	// Disk modalias /sys/block/&lt;dev&gt;/device/modalias.
	modalias?: string

	// uuid
	//
	// Disk UUID /sys/block/&lt;dev&gt;/uuid.
	uuid?: string

	// wwid
	//
	// Disk WWID /sys/block/&lt;dev&gt;/wwid.
	wwid?: string

	// type
	//
	// Disk Type.
	type?: "ssd" | "hdd" | "nvme" | "sd"

	// busPath
	//
	// Disk bus path.
	busPath?: string
}

#InstallExtensionConfig: {
	// image
	//
	// System extension image.
	image?: string
}

#KernelConfig: {
	// modules
	//
	// Kernel modules to load.
	modules?: [...#KernelModuleConfig]
}

#KernelModuleConfig: {
	// name
	//
	// Module name.
	name?: string

	// parameters
	//
	// Module parameters, changes applied after reboot.
	parameters?: [...string]
}

#KubeSpanFilters: {
	// endpoints
	//
	// Filter node addresses which will be advertised as KubeSpan
	// endpoints for peer-to-peer Wireguard connections.
	//
	// By default, all addresses are advertised, and KubeSpan cycles
	// through all endpoints until it finds one that works.
	//
	// Default value: no filtering.
	endpoints?: [...string]
}

#KubeletConfig: {
	// image
	//
	// The image field is an optional reference to an alternative
	// kubelet image.
	image?: string

	// clusterDNS
	//
	// The ClusterDNS field is an optional reference to an alternative
	// kubelet clusterDNS ip list.
	clusterDNS?: [...string]

	// extraArgs
	//
	// The extraArgs field is used to provide additional flags to the
	// kubelet.
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// extraMounts
	//
	// The extraMounts field is used to add additional mounts to the
	// kubelet container.
	// Note that either bind or rbind are required in the options.
	extraMounts?: [...#ExtraMount]

	// extraConfig
	//
	// The extraConfig field is used to provide kubelet configuration
	// overrides.
	//
	// Some fields are not allowed to be overridden: authentication
	// and authorization, cgroups
	// configuration, ports, etc.
	extraConfig?: {
		...
	}

	// defaultRuntimeSeccompProfileEnabled
	//
	// Enable container runtime default Seccomp profile.
	defaultRuntimeSeccompProfileEnabled?: bool

	// registerWithFQDN
	//
	// The registerWithFQDN field is used to force kubelet to use the
	// node FQDN for registration.
	// This is required in clouds like AWS.
	registerWithFQDN?: bool

	// nodeIP
	//
	// The nodeIP field is used to configure --node-ip flag for the
	// kubelet.
	// This is used when a node has multiple addresses to choose from.
	nodeIP?: #KubeletNodeIPConfig

	// skipNodeRegistration
	//
	// The skipNodeRegistration is used to run the kubelet without
	// registering with the apiserver.
	// This runs kubelet as standalone and only runs static pods.
	skipNodeRegistration?: bool

	// disableManifestsDirectory
	//
	// The disableManifestsDirectory field configures the kubelet to
	// get static pod manifests from the /etc/kubernetes/manifests
	// directory.
	// It’s recommended to configure static pods with the “pods” key
	// instead.
	disableManifestsDirectory?: bool
}

#KubeletNodeIPConfig: {
	// validSubnets
	//
	// The validSubnets field configures the networks to pick kubelet
	// node IP from.
	// For dual stack configuration, there should be two subnets: one
	// for IPv4, another for IPv6.
	// IPs can be excluded from the list by using negative match with
	// !, e.g !10.0.0.0/8.
	// Negative subnet matches should be specified last to filter out
	// IPs picked by positive matches.
	// If not specified, node IP is picked based on cluster podCIDRs:
	// IPv4/IPv6 address or both.
	validSubnets?: [...string]
}

#KubernetesTalosAPIAccessConfig: {
	// enabled
	//
	// Enable Talos API access from Kubernetes pods.
	enabled?: bool

	// allowedRoles
	//
	// The list of Talos API roles which can be granted for access
	// from Kubernetes pods.
	//
	// Empty list means that no roles can be granted, so access is
	// blocked.
	allowedRoles?: [...string]

	// allowedKubernetesNamespaces
	//
	// The list of Kubernetes namespaces Talos API access is available
	// from.
	allowedKubernetesNamespaces?: [...string]
}

#LoggingConfig: {
	// destinations
	//
	// Logging destination.
	destinations?: [...#LoggingDestination]
}

#LoggingDestination: {
	// endpoint
	//
	// Where to send logs. Supported protocols are “tcp” and “udp”.
	endpoint?: #Endpoint

	// format
	//
	// Logs format.
	format?: "json_lines"
}

#MachineConfig: {
	// type
	//
	// Defines the role of the machine within the cluster.
	//
	// Control Plane
	//
	// Control Plane node type designates the node as a control plane
	// member.
	// This means it will host etcd along with the Kubernetes
	// controlplane components such as API Server, Controller
	// Manager, Scheduler.
	//
	// Worker
	//
	// Worker node type designates the node as a worker node.
	// This means it will be an available compute node for scheduling
	// workloads.
	//
	// This node type was previously known as “join”; that value is
	// still supported but deprecated.
	type?: "controlplane" | "worker"

	// token
	//
	// The token is used by a machine to join the PKI of the cluster.
	// Using this token, a machine will create a certificate signing
	// request (CSR), and request a certificate that will be used as
	// its’ identity.
	token?: string

	// ca
	//
	// The root certificate authority of the PKI.
	// It is composed of a base64 encoded crt and key.
	ca?: {
		crt?: string
		key?: string
	}

	// certSANs
	//
	// Extra certificate subject alternative names for the machine’s
	// certificate.
	// By default, all non-loopback interface IPs are automatically
	// added to the certificate’s SANs.
	certSANs?: [...string]

	// controlPlane
	//
	// Provides machine specific control plane configuration options.
	controlPlane?: #MachineControlPlaneConfig

	// kubelet
	//
	// Used to provide additional options to the kubelet.
	kubelet?: #KubeletConfig

	// pods
	//
	// Used to provide static pod definitions to be run by the kubelet
	// directly bypassing the kube-apiserver.
	//
	// Static pods can be used to run components which should be
	// started before the Kubernetes control plane is up.
	// Talos doesn’t validate the pod definition.
	// Updates to this field can be applied without a reboot.
	//
	// See
	// https://kubernetes.io/docs/tasks/configure-pod-container/static-pod/.
	pods?: [...{
		...
	}]

	// network
	//
	// Provides machine specific network configuration options.
	network?: #NetworkConfig

	// disks
	//
	// Used to partition, format and mount additional disks.
	// Since the rootfs is read only with the exception of /var,
	// mounts are only valid if they are under /var.
	// Note that the partitioning and formatting is done only once, if
	// and only if no existing XFS partitions are found.
	// If size: is omitted, the partition is sized to occupy the full
	// disk.
	disks?: [...#MachineDisk]

	// install
	//
	// Used to provide instructions for installations.
	//
	// Note that this configuration section gets silently ignored by
	// Talos images that are considered pre-installed.
	// To make sure Talos installs according to the provided
	// configuration, Talos should be booted with ISO or PXE-booted.
	install?: #InstallConfig

	// files
	//
	// Allows the addition of user specified files.
	// The value of op can be create, overwrite, or append.
	// In the case of create, path must not exist.
	// In the case of overwrite, and append, path must be a valid
	// file.
	// If an op value of append is used, the existing file will be
	// appended.
	// Note that the file contents are not required to be base64
	// encoded.
	files?: [...#MachineFile]

	// env
	//
	// The env field allows for the addition of environment variables.
	// All environment variables are set on PID 1 in addition to every
	// service.
	env?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// time
	//
	// Used to configure the machine’s time settings.
	time?: #TimeConfig

	// sysctls
	//
	// Used to configure the machine’s sysctls.
	sysctls?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// sysfs
	//
	// Used to configure the machine’s sysfs.
	sysfs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// registries
	//
	// Used to configure the machine’s container image registry
	// mirrors.
	//
	// Automatically generates matching CRI configuration for registry
	// mirrors.
	//
	// The mirrors section allows to redirect requests for images to a
	// non-default registry,
	// which might be a local registry or a caching mirror.
	//
	// The config section provides a way to authenticate to the
	// registry with TLS client
	// identity, provide registry CA, or authentication information.
	// Authentication information has same meaning with the
	// corresponding field in .docker/config.json.
	//
	// See also matching configuration for CRI containerd plugin.
	registries?: #RegistriesConfig

	// systemDiskEncryption
	//
	// Machine system disk encryption configuration.
	// Defines each system partition encryption parameters.
	systemDiskEncryption?: #SystemDiskEncryptionConfig

	// features
	//
	// Features describe individual Talos features that can be
	// switched on or off.
	features?: #FeaturesConfig

	// udev
	//
	// Configures the udev system.
	udev?: #UdevConfig

	// logging
	//
	// Configures the logging system.
	logging?: #LoggingConfig

	// kernel
	//
	// Configures the kernel.
	kernel?: #KernelConfig

	// seccompProfiles
	//
	// Configures the seccomp profiles for the machine.
	seccompProfiles?: [...#MachineSeccompProfile]

	// nodeLabels
	//
	// Configures the node labels for the machine.
	nodeLabels?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}
}

#MachineControlPlaneConfig: {
	// controllerManager
	//
	// Controller manager machine specific configuration options.
	controllerManager?: #MachineControllerManagerConfig

	// scheduler
	//
	// Scheduler machine specific configuration options.
	scheduler?: #MachineSchedulerConfig
}

#MachineControllerManagerConfig: {
	// disabled
	//
	// Disable kube-controller-manager on the node.
	disabled?: bool
}

#MachineDisk: {
	// device
	//
	// The name of the disk to use.
	device?: string

	// partitions
	//
	// A list of partitions to create on the disk.
	partitions?: [...#DiskPartition]
}

#MachineFile: {
	// content
	//
	// The contents of the file.
	content?: string

	// permissions
	//
	// The file’s permissions in octal.
	permissions?: int

	// path
	//
	// The path of the file.
	path?: string

	// op
	//
	// The operation to use
	op?: "create" | "append" | "overwrite"
}

#MachineSchedulerConfig: {
	// disabled
	//
	// Disable kube-scheduler on the node.
	disabled?: bool
}

#MachineSeccompProfile: {
	// name
	//
	// The name field is used to provide the file name of the seccomp
	// profile.
	name?: string

	// value
	//
	// The value field is used to provide the seccomp profile.
	value?: {
		...
	}
}

#NetworkConfig: {
	// hostname
	//
	// Used to statically set the hostname for the machine.
	hostname?: string

	// interfaces
	//
	// interfaces is used to define the network interface
	// configuration.
	// By default all network interfaces will attempt a DHCP
	// discovery.
	// This can be further tuned through this configuration parameter.
	interfaces?: [...#Device]

	// nameservers
	//
	// Used to statically set the nameservers for the machine.
	// Defaults to 1.1.1.1 and 8.8.8.8
	nameservers?: [...string]

	// extraHostEntries
	//
	// Allows for extra entries to be added to the /etc/hosts file
	extraHostEntries?: [...#ExtraHost]

	// kubespan
	//
	// Configures KubeSpan feature.
	kubespan?: #NetworkKubeSpan

	// disableSearchDomain
	//
	// Disable generating a default search domain in /etc/resolv.conf
	// based on the machine hostname.
	// Defaults to false.
	disableSearchDomain?: bool
}

#NetworkDeviceSelector: {
	// busPath
	//
	// PCI, USB bus prefix, supports matching by wildcard.
	busPath?: string

	// hardwareAddr
	//
	// Device hardware address, supports matching by wildcard.
	hardwareAddr?: string

	// pciID
	//
	// PCI ID (vendor ID, product ID), supports matching by wildcard.
	pciID?: string

	// driver
	//
	// Kernel driver, supports matching by wildcard.
	driver?: string
}

#NetworkKubeSpan: {
	// enabled
	//
	// Enable the KubeSpan feature.
	// Cluster discovery should be enabled with
	// .cluster.discovery.enabled for KubeSpan to be enabled.
	enabled?: bool

	// advertiseKubernetesNetworks
	//
	// Control whether Kubernetes pod CIDRs are announced over
	// KubeSpan from the node.
	// If disabled, CNI handles encapsulating pod-to-pod traffic into
	// some node-to-node tunnel,
	// and KubeSpan handles the node-to-node traffic.
	// If enabled, KubeSpan will take over pod-to-pod traffic and send
	// it over KubeSpan directly.
	// When enabled, KubeSpan should have a way to detect complete pod
	// CIDRs of the node which
	// is not always the case with CNIs not relying on Kubernetes for
	// IPAM.
	advertiseKubernetesNetworks?: bool

	// allowDownPeerBypass
	//
	// Skip sending traffic via KubeSpan if the peer connection state
	// is not up.
	// This provides configurable choice between connectivity and
	// security: either traffic is always
	// forced to go via KubeSpan (even if Wireguard peer connection is
	// not up), or traffic can go directly
	// to the peer if Wireguard connection can’t be established.
	allowDownPeerBypass?: bool

	// mtu
	//
	// KubeSpan link MTU size.
	// Default value is 1420.
	mtu?: int

	// filters
	//
	// KubeSpan advanced filtering of network addresses .
	//
	// Settings in this section are optional, and settings apply only
	// to the node.
	filters?: #KubeSpanFilters
}

#PodCheckpointer: {
	// image
	//
	// The image field is an override to the default pod-checkpointer
	// image.
	image?: string
}

#ProxyConfig: {
	// disabled
	//
	// Disable kube-proxy deployment on cluster bootstrap.
	disabled?: bool

	// image
	//
	// The container image used in the kube-proxy manifest.
	image?: string

	// mode
	//
	// proxy mode of kube-proxy.
	// The default is ‘iptables’.
	mode?: string

	// extraArgs
	//
	// Extra arguments to supply to kube-proxy.
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}
}

#RegistriesConfig: {
	// mirrors
	//
	// Specifies mirror configuration for each registry host
	// namespace.
	// This setting allows to configure local pull-through caching
	// registires,
	// air-gapped installations, etc.
	//
	// For example, when pulling an image with the reference
	// example.com:123/image:v1,
	// the example.com:123 key will be used to lookup the mirror
	// configuration.
	//
	// Optionally the * key can be used to configure a fallback
	// mirror.
	//
	// Registry name is the first segment of image identifier, with
	// ‘docker.io’
	// being default one.
	mirrors?: {
		{[=~".*" & !~"^()$"]: #RegistryMirrorConfig}
		...
	}

	// config
	//
	// Specifies TLS &amp; auth configuration for HTTPS image
	// registries.
	// Mutual TLS can be enabled with ‘clientIdentity’ option.
	//
	// The full hostname and port (if not using a default port 443)
	// should be used as the key.
	// The fallback key * can’t be used for TLS configuration.
	//
	// TLS configuration can be skipped if registry has trusted
	// server certificate.
	config?: {
		{[=~".*" & !~"^()$"]: #RegistryConfig}
		...
	}
}

#RegistryAuthConfig: {
	// username
	//
	// Optional registry authentication.
	// The meaning of each field is the same with the corresponding
	// field in .docker/config.json.
	username?: string

	// password
	//
	// Optional registry authentication.
	// The meaning of each field is the same with the corresponding
	// field in .docker/config.json.
	password?: string

	// auth
	//
	// Optional registry authentication.
	// The meaning of each field is the same with the corresponding
	// field in .docker/config.json.
	auth?: string

	// identityToken
	//
	// Optional registry authentication.
	// The meaning of each field is the same with the corresponding
	// field in .docker/config.json.
	identityToken?: string
}

#RegistryConfig: {
	// tls
	//
	// The TLS configuration for the registry.
	tls?: #RegistryTLSConfig

	// auth
	//
	// The auth configuration for this registry.
	// Note: changes to the registry auth will not be picked up by the
	// CRI containerd plugin without a reboot.
	auth?: #RegistryAuthConfig
}

#RegistryKubernetesConfig: {
	// disabled
	//
	// Disable Kubernetes discovery registry.
	disabled?: bool
}

#RegistryMirrorConfig: {
	// endpoints
	//
	// List of endpoints (URLs) for registry mirrors to use.
	// Endpoint configures HTTP/HTTPS access mode, host name,
	// port and path (if path is not set, it defaults to /v2).
	endpoints?: [...string]

	// overridePath
	//
	// Use the exact path specified for the endpoint (don’t append
	// /v2/).
	// This setting is often required for setting up multiple mirrors
	// on a single instance of a registry.
	overridePath?: bool
}

#RegistryServiceConfig: {
	// disabled
	//
	// Disable external service discovery registry.
	disabled?: bool

	// endpoint
	//
	// External service endpoint.
	endpoint?: string
}

#RegistryTLSConfig: {
	// clientIdentity
	//
	// Enable mutual TLS authentication with the registry.
	// Client certificate and key should be base64-encoded.
	clientIdentity?: {
		crt?: string
		key?: string
	}

	// ca
	//
	// CA registry certificate to add the list of trusted
	// certificates.
	// Certificate should be base64-encoded.
	ca?: string

	// insecureSkipVerify
	//
	// Skip TLS server certificate verification (not recommended).
	insecureSkipVerify?: bool
}

#Route: {
	// network
	//
	// The route’s network (destination).
	network?: string

	// gateway
	//
	// The route’s gateway (if empty, creates link scope route).
	gateway?: string

	// source
	//
	// The route’s source address (optional).
	source?: string

	// metric
	//
	// The optional metric for the route.
	metric?: int

	// mtu
	//
	// The optional MTU for the route.
	mtu?: int
}

#STP: {
	// enabled
	//
	// Whether Spanning Tree Protocol (STP) is enabled.
	enabled?: bool
}

#SchedulerConfig: {
	// image
	//
	// The container image used in the scheduler manifest.
	image?: string

	// extraArgs
	//
	// Extra arguments to supply to the scheduler.
	extraArgs?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}

	// extraVolumes
	//
	// Extra volumes to mount to the scheduler static pod.
	extraVolumes?: [...#VolumeMountConfig]

	// env
	//
	// The env field allows for the addition of environment variables
	// for the control plane component.
	env?: {
		{[=~".*" & !~"^()$"]: string}
		...
	}
}

#SystemDiskEncryptionConfig: {
	// state
	//
	// State partition encryption.
	state?: #EncryptionConfig

	// ephemeral
	//
	// Ephemeral partition encryption.
	ephemeral?: #EncryptionConfig
}

#TimeConfig: {
	// disabled
	//
	// Indicates if the time service is disabled for the machine.
	// Defaults to false.
	disabled?: bool

	// servers
	//
	// Specifies time (NTP) servers to use for setting the system
	// time.
	// Defaults to pool.ntp.org
	servers?: [...string]

	// bootTimeout
	//
	// Specifies the timeout when the node time is considered to be in
	// sync unlocking the boot sequence.
	// NTP sync will be still running in the background.
	// Defaults to “infinity” (waiting forever for time sync)
	bootTimeout?: =~"^[-+]?(((\\d+(\\.\\d*)?|\\d*(\\.\\d+)+)([nuµm]?s|m|h))|0)+$"
}

#UdevConfig: {
	// rules
	//
	// List of udev rules to apply to the udev system
	rules?: [...string]
}

#VIPEquinixMetalConfig: {
	// apiToken
	//
	// Specifies the Equinix Metal API Token.
	apiToken?: string
}

#VIPHCloudConfig: {
	// apiToken
	//
	// Specifies the Hetzner Cloud API Token.
	apiToken?: string
}

#Vlan: {
	// addresses
	//
	// The addresses in CIDR notation or as plain IPs to use.
	addresses?: [...string]

	// routes
	//
	// A list of routes associated with the VLAN.
	routes?: [...#Route]

	// dhcp
	//
	// Indicates if DHCP should be used.
	dhcp?: bool

	// vlanId
	//
	// The VLAN’s ID.
	vlanId?: int

	// mtu
	//
	// The VLAN’s MTU.
	mtu?: int

	// vip
	//
	// The VLAN’s virtual IP address configuration.
	vip?: #DeviceVIPConfig

	// dhcpOptions
	//
	// DHCP specific options.
	// dhcp must be set to true for these to take effect.
	dhcpOptions?: #DHCPOptions
}

#VolumeMountConfig: {
	// hostPath
	//
	// Path on the host.
	hostPath?: string

	// mountPath
	//
	// Path in the container.
	mountPath?: string

	// readonly
	//
	// Mount the volume read only.
	readonly?: bool
}
